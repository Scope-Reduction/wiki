---
parent: GDD
---
# Propozycja mechaniki wykrywania potworów
Założenia:
- zachowany klimat hororru, niepewności, creepy
- nie może być za bardzo arcade
- spójny, kompletny core zamiast dokładania kolejnych i kolejnych mechanik, które i tak potem nudzą
## Główny koncept - gra światłem
W autobusach nocnych światła są przygaszone, żeby wnętrze autobusu nie odbijało się w szybie i nie rozpraszało kierowcy. Niesie to za sobą następującą implikację dla naszej gry: **kierowca widzi albo drogę, albo pasażerów**. 

- Kierowca ma możliwość zapalenia świateł kabinowych. Wnętrze autobusu jest wtedy widoczne w lusterku, jednak odbija się ono w przedniej szybie, co utrudnia prowadzenie pojazdu (kwestia otwarta - zostawiamy "autobus jedzie sam wg. toru, czy kierujemy ręcznie?)
- Potwory zmieniają siedzenie w ciemności. W świetle są grzeczne :3 Dzięki temu nie trzeba nic animować i odpada element cheesu, w którym wystarczy, że gracz czeka na ruch w lusterku, żeby oddać strzał. Teraz musi pamiętać, gdzie kto siedział żeby znaleźć potwora.
- Światła są stare, po kilku sekundach zaczynają mrugać po czym gasną, przegrzewając się na kolejne kilka sekund. Dzięki temu nie można cheesować spamując światłami, aby zatrzymać potwory.
- Światła zapalają się podczas postoju, automatycznie z otwarciem drzwi lub zaciągnięciem hamulca

## Potwory
Potwory mają swoje telle, które umożliwiają ich rozpoznanie, a wraz z upływem czasu w ciemności progressują na kolejne etapy. Każdy kolejny etap przybliża potwora do gracza i utrudnia jego unieszkodliwienie. Progresja wygląda następująco:

Przystanek: Odmowa przy drzwiach nic nie kosztuje; skarga, jeśli był to człowiek

Odjazd, gaśnie światło

Etap 1: siedzi: wyproszenie na przystanku, kosztuje tylko czas postoju. Skarga, jeśli był to człowiek.

ok. 30 s ciemności

Etap 2: przesiada się, za każdym razem coraz bliżej - postój w trasie, użycie wody święconej albo shotguna. Strzał płoszy resztę pasażerów. Opryskany wodą przesiada się do tylnego rzędu, ale już nie można go wygonić. Wariant: tylko ostatnia przesiadka wydaje dźwięk. Pierwsze 1-2 przesiadki są ciche, jeśli gracz je wyłapie to można jeszcze wyprosić.

ok. 20 s ciemności

Etap 3: stoi za tobą - zostaje tylko shotgun. Żeby móc wycelować należy włączyć światło, jeśli akurat jest na cooldownie to nie zdążysz, trzeba się zatrzymać żeby włączyło się postojowe i wtedy strzelić. 

Atak - kończy noc

Potwór progressuje w ciemności, a każdy etap zamyka tańsze wyjścia z etapów wyżej.

### Telle
Czy będzie więcej niż jedna rodzina potworów będzie do ustalenia, na razie takie pomysły:

Topielce:
- na przystanku nie leci im para z ust, gdy stoją przy drzwiach
- gdy siedzi pojawia się szron na szybie przy jego miejscu, widać to w świetle
- przesiadanie się daje dźwięk trzasku lodu, szron zostaje przy szybie gdzie wcześniej siedział
- gdy się zbliża kierowcy zaczyna lecieć para z ust
- gdy stoi za plecami kierowcy leci gęsta para z ust, na brzegu lusterka pojawia się szron, słychać oddech za uchem
Patrzeńce:
- na przystanku ich oczy odbijają blask reflektorów
- gdy siedzi widać dwa jasne punkty w ciemnym lusterku. w jasnym lusterku wyglądają normalnie
- przy przesiadaniu skrzypi fotel
- gdy jest blisko widać dwa punkty tuż przy krawędzi lusterka

## Pasażerowie
Dodają życia w autobusie:
- śpią, patrzą w okno, kaszlą, rozmawiają, wsiadają i wysiadają, gdy autobus stoi na przystanku
- nigdy nie zmieniają miejsc i nie wstają w czasie jazdy
- da się ich zapamiętać, składają się z modularnych części a generator postaci nie powtarza zestawów w jednym kursie
### Zmyłki
Nie wchodzą w zakres pierwszego prototypu, kilka sugestii:
- para z ust na szybie gdy śpią może wyglądać jak szron
- jeśli korzysta z telefonu to światło może wyglądać jak oczy patrzeńca
