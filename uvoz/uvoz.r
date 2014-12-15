# 2. faza: Uvoz podatkov

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

