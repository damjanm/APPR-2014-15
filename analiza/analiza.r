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
zz1<-levels(svet$name_long)
cc1<-select(t4,Country,Year.inaugurated,Bicycles)
cc2<-group_by(cc1, Country,Year.inaugurated)
cc3<-summarise(cc2, st=sum(Bicycles,na.rm=TRUE))
cc3<-cc3[!is.na(cc3[,2]),]

aq95<-data.frame(cc3[cc3[,2]==1995,])
aq97<-data.frame(cc3[cc3[,2]==1997,])
aq98<-data.frame(cc3[cc3[,2]==1998,])
aq00<-data.frame(cc3[cc3[,2]==2000,])
aq01<-data.frame(cc3[cc3[,2]==2001,])
aq03<-data.frame(cc3[cc3[,2]==2003,])
aq04<-data.frame(cc3[cc3[,2]==2004,])
aq05<-data.frame(cc3[cc3[,2]==2005,])
aq06<-data.frame(cc3[cc3[,2]==2006,])
aq07<-data.frame(cc3[cc3[,2]==2007,])
aq08<-data.frame(cc3[cc3[,2]==2008,])
aq09<-data.frame(cc3[cc3[,2]==2009,])
aq10<-data.frame(cc3[cc3[,2]==2010,])
aq11<-data.frame(cc3[cc3[,2]==2011,])
aq12<-data.frame(cc3[cc3[,2]==2012,])
aq13<-data.frame(cc3[cc3[,2]==2013,])
aq14<-data.frame(cc3[cc3[,2]==2014,])


# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
cairo_pdf("slike/anim1.pdf",width = 9.27, height = 5.69, family = "Arial", 
          onefile = TRUE)

plot(svet)
title("Nove sisteme v 1995")
points(koordinate[zz[aq95[,1]],c(1,2)],pch=16,col="red",cex=1.3)


plot(svet)
title("Nove sisteme v 1997")
points(koordinate[zz[aq97[,1]],1],koordinate[zz[aq97[,1]],2],pch=16,col="red",cex=1.3)

plot(svet)
title("Nove sisteme v 1998")
points(koordinate[zz[aq98[,1]],1],koordinate[zz[aq98[,1]],2],pch=16,col="red",cex=1.3)

plot(svet)
title("Nove sisteme v 2000")
points(koordinate[zz[aq00[,1]],c(1,2)],pch=16,col="red",
       cex=1.3)

plot(svet)
title("Nove sisteme v 2001")
points(koordinate[zz[aq01[,1]],1],koordinate[zz[aq01[,1]],2],pch=16,col="red",cex=1.3)

plot(svet)
title("Nove sisteme v 2003")
points(koordinate[zz[aq03[,1]],c(1,2)],pch=16,col="red",
       cex=1+aq03[,3]/norm(as.matrix(aq03[,3])))

plot(svet)
title("Nove sisteme v 2004")
points(koordinate[zz[aq04[,1]],1],koordinate[zz[aq04[,1]],2],pch=16,col="red",cex=1.3)

plot(svet)
title("Nove sisteme v 2005")
points(koordinate[zz[aq05[,1]],c(1,2)],pch=16,col="red",
       cex=1+aq05[,3]/norm(as.matrix(aq05[,3])))

plot(svet)
title("Nove sisteme v 2006")
points(koordinate[zz[aq06[,1]],c(1,2)],pch=16,col="red",
       cex=1+aq06[,3]/norm(as.matrix(aq06[,3])))

plot(svet)
title("Nove sisteme v 2007")
points(koordinate[zz[aq07[,1]],c(1,2)],pch=16,col="red",
       cex=1+aq07[,3]/norm(as.matrix(aq07[,3])))

zz[aq08[8,1]]<-"Korea"
plot(svet)
title("Nove sisteme v 2008")
points(koordinate[zz[aq08[,1]],1],koordinate[zz[aq08[,1]],2],pch=16,
       col="red",cex=1.3+aq08[,3]/norm(as.matrix(aq08[,3])))

plot(svet)
title("Nove sisteme v 2009")
points(koordinate[zz[aq09[,1]],c(1,2)],pch=16,col="red",
       cex=1.3+aq09[,3]/norm(as.matrix(aq09[,3])))

plot(svet)
title("Nove sisteme v 2010")
points(koordinate[zz[aq10[,1]],c(1,2)],pch=16,col="red",
       cex=1.3+aq10[,3]/norm(as.matrix(aq10[,3])))

plot(svet)
title("Nove sisteme v 2011")
points(koordinate[zz[aq11[,1]],c(1,2)],pch=16,col="red",
       cex=1.3+aq11[,3]/norm(as.matrix(aq11[,3])))

plot(svet)
title("Nove sisteme v 2012")
points(koordinate[zz[aq12[,1]],c(1,2)],pch=16,col="red",
       cex=1.3+aq12[,3]/norm(as.matrix(aq12[,3])))


zz[aq13[14,1]]<-"Russia"
plot(svet)
title("Nove sisteme v 2013")
points(koordinate[zz[aq13[,1]],c(1,2)],pch=16,col="red",
       cex=1.3+aq13[,3]/norm(as.matrix(aq13[,3])))

plot(svet)
title("Nove sisteme v 2014")
points(koordinate[zz[aq14[,1]],c(1,2)],pch=16,col="red",
       cex=1.3+aq14[,3]/norm(as.matrix(aq14[,3])))
dev.off()