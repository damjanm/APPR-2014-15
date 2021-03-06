# Prvi graf - izračun
# Seštejemo kolikokrat uporabijo kolesa v različnih dnev. 0-Nedelja, 1-Ponedeljek, 2-Torek...
k2 <- sapply(0:6, function(x) sum(t1[t1[,6] == x, 15]))/1000
names(k2)<-c("Nedelja","Pon","Torek","Sreda","Četrtek","Petek","Sobota")

#Drugi graf - izračun
#Seštejemo odhode in prihode v različnih občin.
k1<- sapply(c("Arlington, VA","Alexandria, VA","Washington, DC","Rest of Montgomery County, MD","Rockville, MD"), function(x) sum(t2[t2[,2] == x, 5])+sum(t2[t2[,2] == x, 6]))
k1<-k1/1000
names(k1)<-c("Arlington","Alexandria","Washington","RMC","RV")

#Tretji graf
k3<- sapply(1995:2014, function(x) sum(t4[,7]==x, na.rm = TRUE))
names(k3)<-1995:2014


#Risanje grafov
pdf("slike/grafi1.pdf",paper="a4")
barplot(k2,main="Uporaba koles v različnih dnevih 2011-2012")
dev.off()
pdf("slike/grafi1a.pdf",paper="a4")
barplot(k1,xlab="Mesta, ki uporabljajo sistema Capital Bikeshare",ylab="Število odhodov in prihodov",
        main="Število izposojenih koles v Juliju 2014",col="red")
barplot(k3, main="Število novih odprtih sistemov v vsakem letu")
dev.off()


pdf("slike/grafi3.pdf",paper="a4")
ku <- sapply(0:23, function(x) sum(t5[t5[,6] == x, 17]))
names(ku)<-0:23
barplot(ku, main="Uporaba koles v različnih urah skozi celem letu", col="magenta")
dev.off()
