# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")
library(mgcv)


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


legend("topleft", legend=c("Linearna metoda", 
                              "Kvadratna medtoda", "Loess", "Gam"), lty="solid", 
       cex = 0.8, col = c("blue", "red", "green","purple"))


vsota.kvadratov<-sapply(list(lin, kv, mls1, mgam1), function(x) sum(x$residuals^2))
#  2259.0128  1055.2984  802.6469  791.2780
dev.off()

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
