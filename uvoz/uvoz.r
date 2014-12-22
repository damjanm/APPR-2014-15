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
t1$date <- as.Date(t1$date, "%m/%d/%Y")

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
t2$Date <- as.Date(t2$Date, "%m/%d/%Y")
levels(t2$Trip.Duration) <-c("<0.5 hr","0.5 - 1 hr","1 - 1.5 hr","1.5 - 2 hr","2 - 3 hr","3 - 4 hr","4 - 5 hr","5 - 24 hr")

#Tabela 3

uvozitabela3 <- function() {
  return(read.csv("podatki/tabela3.csv", sep = ",", as.is = TRUE,
                    col.names = c("Year", "Month", "Station Name","Municipality","Departures","Arrivals"),
                    fileEncoding = "UTF-8"))
}

# Zapišimo podatke v razpredelnico tabela3.
cat("Uvažam podatke...\n")
t3 <- uvozitabela3()

#Tabela 4
source("lib/xml.r", encoding="UTF-8")
cat("Uvažam podatke...\n")
t4<-uvozi.bike()
