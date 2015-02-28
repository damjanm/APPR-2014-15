# Poročilo

## Izbira Teme

  Tema mojega proekta je Sistemi za souporabo koles. V njem bom obravnaval podatke, pridobljene iz ameriškega podjetja Capital Bikeshare, ki velja za eden od največjih sistemov na svetovni ravni in se ukvarja z izposojo koles v kratkem časovnem obdobju (podobno sistemu Bicikelj v Ljubljani). V nadaljevanju bomo pogledali koliko se uporabljajo te sisteme v različnih državah. 
  
  Cilj projekta je raziskati možnosti optimizacije za izposojo koles na podlagi številk polnih/praznih postajališč, številk uporabnikov v določenem obdobju in številk poškodovanih koles.
  
  Povezave do podatkov:
  
1.  http://cabidashboard.ddot.dc.gov/cabidashboard/#Home

2.	https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset

3.	http://www.capitalbikeshare.com/system-data

## Obdelava, uvoz in čiščenje podatkov

Uporabil sem 5 tabel. Štiri tabele sem uvozil v CSV obliki, peta pa iz spletne strani kot html. Preden sem jih uvozil, sem pobrisal nepotrebne vrstice in stolpce.

Na spodnjih grafih sem prikazal in primerjal uporabo koles med tednom. Lahko sklepamo, da ni bistvene razlike v uporabi, oziroma da se število uporabljenih koles ne spreminja v različnih dnevih. Uporaba v različnih urah enem dnevu se pa razlikuje. Tretji graf ponazarja, da se večinoma uporabnikov nahajajo v Washington D.C, vendar pa je podjetje prisotno tudi v nekaterih drugih ameriških mestah. Na četrtem grafu pa vidimo, da se je trend uporabe takšnih sistemov povečal v zadnjih letih.

## Analiza in vizualizacija podatkov

V tej fazi sem naredil dva zemljevida. Potrebno je bilo dodati nekaj podatkov, ki se razlikujejo od začetnih. Na prvem zemljevidu sem razdelil države v 3 skupinah (v odvisnosti od števila mest, ki uporabljajo tega sistema). Na drugem zemljevidu sem zanemaril Kitajsko (ki je sicer nesporni lider v sistemih te vrste), da bi dobil boljši zemljevid. Na prvem zemljevidu sem razdelil države v 3 skupinah (v odvisnosti od števila mest, ki uporabljajo tega sistema). Vidimo, da to ustreza rezultatu, ki je prikazan na prvemu zemljevidu.

Čeprav iz zemljevidov ni razvidno, s pomočjo statisničnih orodjih sem ugotovil, da so podatke razpršene. Po izračunu sem dobil, da je mediana 790, sredina 3593.204, ter standardni odklon 7690.308. Torej lahko sklepamo, da večinoma držav imajo majhno število razpoložljivih koles. 

## Napredna analiza podatkov

  V zadnji fazi sem pogledal kakšne zaključke lahko izvlečemo iz tabel, ki sem jih obravnaval. Uporabil sem metode, ki smo jih imeli na vajah (prileganje), nasvete iz zadnje predstavitve, ter orodja, ki so bili dani v virih na spletni učilnici.

  Najprej sem narisal zemljevid, ki prikazuje razmerje med številom razpoložljivih koles in številom prebivalcev, torej zemljevid podoben drugemu zemljevidu iz prejšnje faze. 
  
  Ker iz zemljevida ni razvidno katere države imajo najboljše razmere, sem naredil graf na kateremu se vidijo prvih 5 držav. 

  Poleg tega, sem uporabil še metode za prileganje podatkom o novih odprtih sistemih skozi čas.
  
## Zaključek  
  
  Pogledali smo si stanje in trendi na svetovni ravni o sistemih za souporabo koles, navade, ki jih imajo kolesarji, ter dejavniki, ki vplivajo na uporabo. Pri tem sem poskusil uporabiti čim več različnih načinov analize podatkov.


