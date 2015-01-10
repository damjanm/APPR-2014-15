# Poročilo

## Izbira Teme

  Tema mojega proekta je  Sistemi za souporabo koles. V njem bom obravnaval podatke, pridobljene iz ameriškega podjetja Capital Bikeshare, ki se ukvarja z izposoje koles v kratkem časovnem obdobju (podobno sistemu Bicikelj v Ljubljani). Pogledali bomo katere dejavnike vplivajo na uporabo koles (vreme, temperatura, vlaga, itn), ter kdaj se le-ti največ izposojajo (v katerih urah/mesecah).
  
  Cilj projekta bo določiti kako bi podjetje optimiziralo izposoje koles, pri čemer bomo upoštevali tudi število polnih/praznih postajališč, število uporabnikov v določenem obdobju in število poškodovanih koles .
  
  Povezave do podatkov:
  
1.  http://cabidashboard.ddot.dc.gov/cabidashboard/#Home

2.	https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset

3.	http://www.capitalbikeshare.com/system-data

## Obdelava, uvoz in čiščenje podatkov

Uporabil sem 4 tabele. Tri tabele sem uvozil v CSV obliki, četrta pa iz spletne strani kot html. Preden sem jih uvozil, sem pobrisal nekatere vrstice/stolpce, ki so bili odveč.

Z grafom sem pokazal razmerje uporaba koles v različnih dnev in se vidi da ni neke bistvene razlike v uporabo, oziroma da število uporabljenih koles se ne poveča bistveno v različnih dnev. Drugi graf pa nam ponazarja da se večinoma uporabnikov nahajajo v Washington D.C, vendar pa je podjetje prisotno tudi v nekaterih drugih občinah.

## Analiza in vizualizacija podatkov

V tej fazi sem naredil dva zemljevida. Potrebno je bilo dodati nekaj podatkov ter očistiti začetne podatke. Na teh zemljevidov sem izpostavil Kitajska (ki je sicer nesporen lider), da bi dobil boljše zemljevide. Na drugem zemljevidu sem razdelil države v 3 skupinah (odvisno od tem koliko postajališč ima vsaka) in vidimo da to ustreza s rezultatom iz prvega zemljevida.



