# Uvoz s spletne strani

library(XML)

# # Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# # iz vozlišč, ki ustrezajo podani poti.
# stripByPath <- function(x, path) {
#   unlist(xpathApply(x, path,
#                     function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
# }
# 
# uvozi.obcine <- function() {
#   url.obcine <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   doc.obcine <- htmlTreeParse(url.obcine, useInternalNodes=TRUE)
#   
#   # Poiščemo vse tabele v dokumentu
#   tabele <- getNodeSet(doc.obcine, "//table")
#   
#   # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
#   # trenutnim vozliščem
#   vrstice <- getNodeSet(tabele[[2]], "./tr")
#   
#   # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
#   # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
#   seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
#   
#   # Iz seznama vrstic naredimo matriko
#   matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
#   
#   # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
#   colnames(matrika) <- gsub("\n", " ", stripByPath(tabele[[2]][[1]], ".//th"))
#   
#   # Podatke iz matrike spravimo v razpredelnico
#   return(data.frame(apply(gsub("\\*", "",
#                                gsub(",", ".",
#                                     gsub("\\.", "", matrika[,2:5]))),
#                           2, as.numeric), row.names=matrika[,1]))
# }



# Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# iz vozlišč, ki ustrezajo podani poti.
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
}


  uvozi.bike <- function(){
    url.bike <- "http://en.wikipedia.org/wiki/List_of_bicycle_sharing_systems"
    doc.bike <- htmlTreeParse(url.bike, useInternalNodes=TRUE)


# Pobrišemo nevidno vsebino
for (t in getNodeSet(doc.bike, "//span[@style='display:none']|//span[@class='sortkey']")) {
  xmlValue(t) <- ""  
} 

# Poiščemo vse tabele v dokumentu
tabele <- getNodeSet(doc.bike, "//table") 

# Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
# trenutnim vozliščem
vrstice <- getNodeSet(tabele[[1]], "./tr") 

# Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
# s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td") 
seznam <- lapply(seznam, function(x) x[-11])

# Iz seznama vrstic naredimo matriko
matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE) 

# Imena stolpcev matrike dobimo iz celic glave (<th>) prve vrstice
colnames(matrika) <- gsub("\n", " ", stripByPath(vrstice[[1]], ".//th")[-11]) 

# Podatke iz matrike spravimo v razpredelnico
return(data.frame(matrika[,1:6],
                  Year.inaugurated = as.numeric(gsub(".*?([0-9]{4}).*", "\\1",
                                                     matrika[,7])),
                  apply(gsub(".*?([0-9]*).*", "\\1",
                             gsub(",", "", matrika[,8:9])), 2, as.numeric)))
}