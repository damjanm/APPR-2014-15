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
aa<-c()
for(i in drzave){
  if(i %in% aa==FALSE){
    aa[i]<-0
  }
  for(j in 1:347){
    if(i==t4[j,2]){      
      aa[i]<-aa[i]+1
    }
  }
}
#naredimo urejenostno spremenljivko

v<-rep(2,length(drzave))
v[aa<4]<-1
v[aa>30]<-3
names(v)<-drzave
#1 - low; 2 - medium; 3 - high



svet$urejenost<-c("na")
svet$stevilo.koles<-c(0)
e1<-sapply(drzave, function(x) sum(t4[t4[,2]==x,9], na.rm=TRUE)) #število razpoložvljivih koles v vsaki državi
names(e1)<-drzave
k<-data.frame(svet)
#Nisem tega znal naresti s pomočjo sapply/apply.
for(j in drzave){
  for(i in 1:177){  
    if(k[i,19]==j){
      svet[i,65]<-e1[j]
      svet[i,64]<-v[j]
    }    
  }
}  
svet[31,65]<-0 # Kitajska damo stran, ker ima 100 krat več koles. Brez njo dobimo boljši zemljevid.



#Narišimo zemljevide

cat("Rišem zemljevid...\n")
pdf("slike/zemljevid1.pdf")

print(spplot(svet, "stevilo.koles", col.regions = c("white",  rainbow(15, 
                    start=0, end = 10/12)), main="Število razpoložljivih koles v vsaki državi",             
      par.settings = list(panel.background=list(col="lightblue"))))

dev.off()




colo<-c()
colo["1"]<-"red"
colo["2"]<-"blue"
colo["3"]<-"green"
cat("Rišem zemljevid...\n")
pdf("slike/zemljevid2.pdf")
#Razporedimo države po tem koliko postajališč imajo
print(plot(svet, col=ifelse(svet$urejenost=="1",colo[1],
                      ifelse(svet$urejenost=="2",colo[2],ifelse(svet$urejenost=="3",colo[3],"white")))))

dev.off()
