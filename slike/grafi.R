# Prvi graf - izračun
# Seštejemo kolikokrat uporabijo kolesa vo različnih dnev. 0-Nedelja, 1-Ponedeljek, 2-Torek...
k2 <- sapply(0:6, function(x) sum(t1[t1[,6] == x, 15]))/1000
names(k2)<-c("Nedelja","Pon","Torek","Sreda","Četrtek","Petek","Sobota")

#Drugi graf - izračun
#Seštejemo odhode in prihode v različnih občin.
k1<- sapply(c("Arlington","Alexandria","Wash.","RMC","Rv./SG"), function(x) sum(t2[t2[,4] == x, 5])+sum(t2[t2[,4] == x, 6]))



#Risanje grafov
pdf("slike/grafi1.pdf",paper="a4")
barplot(k2,main="Uporaba koles v različnih dnev 2011-2012")
barplot(k1,xlab="Različne občine",ylab="Število odhodov in prihodov",
        main="Število izposojenih koles v Juliju 2014",col="red")
dev.off()