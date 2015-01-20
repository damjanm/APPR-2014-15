# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "europa", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.svet <- c()
  manjkajo <- ! nove.svet %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.svet[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
drzave <- levels(t4[,2])

#Vektor, ki pove v koliko različnih mestah ima dano državo razvite sisteme.
aa <- table(t4[,2])
#naredimo urejenostno spremenljivko

v<-rep(2,length(drzave))
v[aa<4]<-1
v[aa>30]<-3
names(v)<-drzave
#1 - low; 2 - medium; 3 - high


e1<-sapply(drzave, function(x) sum(t4[t4[,2]==x,9], na.rm=TRUE)) #število razpoložvljivih koles v vsaki državi
names(e1)<-drzave
m <- match(svet$name_long, drzave)
svet$urejenost <- v[m]
svet$stevilo.koles <- e1[m]



svet[31,65]<-0 # Kitajska damo stran, ker ima 100 krat več koles. Brez njo dobimo boljši zemljevid.



#Narišimo zemljevide

cat("Rišem zemljevid...\n")
pdf("slike/zemljevid1.pdf")

print(spplot(svet, "stevilo.koles", col.regions = c("white",  rainbow(15, 
                    start=0, end = 10/12)), main="Število razpoložljivih koles v vsaki državi"))

dev.off()




colo<-c()
colo["1"]<-"red"
colo["2"]<-"blue"
colo["3"]<-"green"
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid2.pdf")
#Razporedimo države po tem koliko postajališč imajo
plot(svet, col=ifelse(svet$urejenost=="1",colo[1],
                      ifelse(svet$urejenost=="2",colo[2],ifelse(svet$urejenost=="3",colo[3],"white"))),
      main="Porazdelitev držav v treh skupinah")
legend("bottom", legend = c("1. cona - države, ki imajo razvite sisteme v manj kot 4 mesta"
                                ,"2. cona - države, ki imajo razvite sisteme v 4-30 mest",
                                "3. cona - države, ki imajo razvite sisteme v več kot 30 mest"),
       fill = c("red","blue","green"), bg = "white")


dev.off()
