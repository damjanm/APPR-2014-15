# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziDruzine <- function() {
  return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
                      row.names = 1,
                      col.names = c("obcina", "en", "dva", "tri", "stiri"),
                      fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o družinah...\n")
druzine <- uvoziDruzine()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

# Tabela 1

uvozitabela1 <- function() {
  return(read.table("podatki/tabela1.csv", sep = ",", as.is = TRUE,
                    row.names = 1,
                    col.names = c("instant", "date", "season", "year", "month","holiday","weekday","workingday","weathersit"
                                  ,"temp","atemp","hum","windspeed","casual","registered","cnt"),
                    fileEncoding = "UTF-8"))
}

# Zapišimo podatke v razpredelnico tabela1.
cat("Uvažam podatke...\n")
t1 <- uvozitabela1()

#Tabela 2

uvozitabela2 <- function() {
  return(read.csv("podatki/tabela2.csv", sep = ",", as.is = TRUE,
                    col.names = c("Date", "Municipality", "Trip Duration","Membership Type","No. of Trips",
                                  "Miles Travelled"),
                    fileEncoding = "UTF-8"))
}

# Zapišimo podatke v razpredelnico tabela2.
cat("Uvažam podatke...\n")
t2 <- uvozitabela2()

#Tabela 3

uvozitabela3 <- function() {
  return(read.csv("podatki/tabela3.csv", sep = ",", as.is = TRUE,
                    col.names = c("Year", "Month", "Station Name","Municipality","Departures","Arrivals"),
                    fileEncoding = "UTF-8"))
}

# Zapišimo podatke v razpredelnico tabela3.
cat("Uvažam podatke...\n")
t3 <- uvozitabela3()

