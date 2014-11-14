# Analiza podatkov s programom R, 2014/15

Avtor: Damjan Manevski

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

  Tema mojega proekta je  Sistemi za souporabo koles. V njem bom obravnaval podatke, pridobljene iz ameriškega podjetja Capital Bikeshare, ki se ukvarja z izposoje koles v kratkem časovnem obdobju (podobno sistemu Bicikelj v Ljubljani). Pogledali bomo katere dejavnike vplivajo na uporabo koles (vreme, temperatura, vlaga, itn), ter kdaj se le-ti največ izposojajo (v katerih urah/mesecah).
  
  Cilj projekta bo določiti kako bi podjetje optimiziralo izposoje koles, pri čemer bomo upoštevali tudi število polnih/praznih postajališč, število uporabnikov v določenem obdobju in število poškodovanih koles .
  
  Povezave do podatkov:
  
1.	http://cabidashboard.ddot.dc.gov/cabidashboard/#Home

2.	https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset

3.	http://www.capitalbikeshare.com/system-data

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
