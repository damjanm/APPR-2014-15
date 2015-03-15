# 4. faza: Analiza podatkov
source("lib/uvozi.zemljevid.r")
# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")
library(mgcv)
library(dplyr)

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

# Narišemo graf v datoteko PDF.
cat("Rišem graf...\n")
cairo_pdf("slike/grafi2.pdf", width = 9.27, height = 5.69, family = "Arial") 


c=1995:2014
plot(c, k3,
     main = "Število novih odprtih sistemov v vsakem letu",
     xlab = "",
     ylab = "",
)


#LINEARNA METODA
lin <- lm(k3 ~ c)
abline(lin, col="blue")

#KVADRATNA METODA
kv <- lm(k3 ~ I(c^2) + c)
curve(predict(kv, data.frame(c=x)), add = TRUE, col = "red")

#LOESS MODEL
mls1 <- loess(k3 ~ c)
curve(predict(mls1, data.frame(c=x)), add = TRUE, col = "green")

#GAM MODEL
mgam1 <- gam(k3 ~ s(c))
curve(predict(mgam1, data.frame(c=x)), add = TRUE, col = "purple")


legend("topleft", legend=c("Linearna: lm(sistemi ~ leto)", 
                              "Kvadratna: lm(sistemi ~ I(leto^2) + leto)", "Loess", "Gam"), lty="solid", 
       cex = 0.8, col = c("blue", "red", "green","purple"))

dev.off()
vsota.kvadratov<-sapply(list(lin, kv, mls1, mgam1), function(x) sum(x$residuals^2))
#  2259.0128  1055.2984  802.6469  791.2780


cat("Rišem graf...\n")
cairo_pdf("slike/grafi4.pdf", width = 9.27, height = 5.69, family = "Arial") 

qw1<-ifelse(is.na(svet$st.koles.prebivalstvo),FALSE,TRUE)
qw<-sort(svet$st.koles.prebivalstvo[qw1])
drzavee<-svet$admin[order(svet$st.koles.prebivalstvo, decreasing=TRUE)[1:5]]
rr<-c(qw[length(qw)],qw[length(qw)-1],qw[length(qw)-2],qw[length(qw)-3],qw[length(qw)-4])
names(rr)<-drzavee

barplot(rr, main= "Prvih pet držav z najboljšimi razmerji med 
               število razpoložljivih koles in število prebivalcev")

dev.off()


#ANIMACIJA
koordinate<-coordinates(svet[,])
imena <- as.character(svet$name)
rownames(koordinate) <- imena
names(imena) <- imena

zz<-levels(t4$Country)
cc1<-select(t4,Country,Year.inaugurated,Bicycles)
cc2<-group_by(cc1, Country,Year.inaugurated)
cc3<-summarise(cc2, st=sum(Bicycles,na.rm=TRUE))
cc3<-cc3[!is.na(cc3[,2]),]
aq95<-data.frame(cc3[cc3[,2]==1995,])
aq97<-data.frame(cc3[cc3[,2]==1997,])

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
cairo_pdf("slike/anim1.pdf",width = 9.27, height = 5.69, family = "Arial", 
          onefile = TRUE)

plot(svet)
title("Nove sisteme v 1995")
points(koordinate[zz[aq95[,1]],c(1,2)],pch=16,col="red",cex=1.3)


plot(svet)
title("Nove sisteme v 1997")
points(koordinate[zz[aq97[,1]],c(1,2)],pch=16,col="red",cex=1.3)

dev.off()