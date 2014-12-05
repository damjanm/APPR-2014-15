# Prvi graf - izračun
# Seštejemo kolikokrat uporabijo kolesa vo različnih dnev. 0-Nedelja, 1-Ponedeljek, 2-Torek...
a1=0 
a2=0 
a3=0 
a4=0
a5=0
a6=0
a0=0
for(i in 1:731){
  if(t1[i,6]==1){
    a1<-t1[i,15]    }
  if(t1[i,6]==2){
    a2<-a2+t1[i,15]  }  
  if(t1[i,6]==3){
    a3<-a3+t1[i,15]  }   
  if(t1[i,6]==4){
    a4<-a4+t1[i,15]   }
  if(t1[i,6]==5){
    a5<-a5+t1[i,15]    }
  if(t1[i,6]==6){
    a6<-a6+t1[i,15]    }
  if(t1[i,6]==0){
    a0<-a0+t1[i,15]    }
}
k2<-c(a1,a2,a3,a4,a5,a6,a0)
names(k2)<-c("Ponedeljek","Torek","Sreda","Četrtek","Petek","Sobota","Nedelja")


#Drugi graf - izračun
#Seštejemo odhode in prihode v različnih občin.
s1=0 
s2=0 
s3=0 
s4=0 
s5=0
for(i in 1:314){
  if(t3[i,4]=="Arlington, VA"){
    s1 <- s1+t3[i,5]+t3[i,6]
  }
  if(t3[i,4]=="Alexandria, VA"){
    s2 <- s2+t3[i,5]+t3[i,6]
  }
  if(t3[i,4]=="Washington, DC"){
    s3 <- s3+t3[i,5]+t3[i,6]
  }
  if(t3[i,4]=="Rest of Montgomery County"){
    s4 <- s4+t3[i,5]+t3[i,6]
  }
  if(t3[i,4]=="Rockville/Shady Grove"){
    s5 <- s5+t3[i,5]+t3[i,6]
  }
}
k1<-c(s1,s2,s3,s4,s5)
names(k1)<-c("Arlington","Alexandria","Wash.","RMC","Rv./SG")


#Risanje grafov
pdf("slike/grafi1.pdf",paper="a4")
pie(k2,main="Uporaba koles v različnih dnev 2011-2012")
barplot(k1,xlab="Različne občine",ylab="Število odhodov in prihodov",
        main="Število izposojenih koles v Juliju 2014",col="red")
dev.off()