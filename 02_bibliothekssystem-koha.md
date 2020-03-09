# Bibliothekssystem Koha

## Einführung in Koha

* Name "Koha" = Geschenk, bei dem man ein Gegengeschenk erwartet
* Webseite: https://koha-community.org
* Weltweites Open Source Projekt, gegründet 1999 in Neuseeland, heute mit Beteiligung von Unternehmen wie ByWater Solutions, Biblibre, Catalyst IT, PTFS Europe, Theke Solutions
* Status des Projekts (Statistik bei Open Hub): https://www.openhub.net/p/koha
* Professionelle Entwicklungsstrukturen, vgl. Dashboard: https://dashboard.koha-community.org/
* Release Notes zur Version 19.05: https://koha-community.org/koha-19-05-04-release/
* Handbuch zur Version 19.05: [englisch](https://koha-community.org/manual/19.05/en/html/), [deutsch](http://koha-community.org/manual/19.05/de/html/index.html) (und weitere Sprachen!)

## Koha Demo

* MARC21, Koha 19.05 bereitgestellt von Unternehmen "Admin Kuhn"
  * [OPAC](http://koha.adminkuhn.ch/)
  * [Staff Interface](http://koha.adminkuhn.ch:8080/) mit Benutzername `demo` / Passwort `demo`

## Koha Installation und Tutorial

Erstellen Sie zunächst in VirtualBox einen Snapshot vom aktuellen System. Diesen Stand können Sie wiederherstellen falls Probleme auftreten.

Für die Installation steht ein Jupyter Notebook bereit.

1. Öffnen Sie das Jupyter Notebook `02-koha-install.ipynb`
2. Führen Sie alle Zellen der Reihe nach aus
3. Starten Sie mit dem folgenden Tutorial.

## Notizen zum Koha Tutorial

Stephan Tetzel (2018): [Wie man Koha installiert und für Schulen einrichtet](https://zefanjas.de/wie-man-koha-installiert-und-fuer-schulen-einrichtet-teil-1/) (Kapitel 1-6)

Zu Kapitel 1:
* Datenbank einrichten
  * im Testsystem ungesichert und ohne Passwort!
* MARC21: International verbreiteter Metadaten-Standard, begründet von der Library of Congress 1999: https://www.loc.gov/marc/bibliographic/
  * wird zukünftig voraussichtlich von BIBFRAME abgelöst
  * Koha und alle anderen großen Bibliothekssysteme basieren in der Regel auf MARC21
* Benutzer: In der Installation angelegt, Benutzernummer 1
* Medientyp: Buch angelegt

Zu Kapitel 2:
* Export/Import:
  * Dateiformate CSV, ODS, XML
  * Programme: Tabellenverarbeitung (Gnumeric/Excel/Libre Office), Text Editor (Leafpad, Editor, TextEdit, Notepad++)
  * Führende Nullen werden in Tabellenverarbeitungen verschluckt, das sorgt hier bei den MARC-Feldern für ein Problem, weil `020` nicht gleich `20` ist.

## Koha Literatur

* Koha Anwenderhandbuch des Bibliothekservice-Zentrum Baden-Württemberg: https://wiki.bsz-bw.de/doku.php?id=l-team:koha:koha-handbuch:start (für ältere Versionen geschrieben)
* Implementation Checklist: https://koha-community.org/manual/19.05/en/html/implementation_checklist.html
* Fred King: How to use Koha, MarcEdit, a Raspberry Pi, and a Chicken (optional) to create an ILS for under $100 (September 2019, Vortrag auf Koha-Konferenz): http://avengingchicken.online/misc/installing_koha_on_raspberry-pi-4.pdf

## Diskussion

* Wechsel von Bibliothekssystemen: Datenimport möglich?
  * Ja, aber je nach Bibliothekssystem unterschiedliche Datenformate. Unterschiedliche Tabellen für Nutzer\*innen, Titeldaten, offene Gebühren, etc.
  * Beispiel aus einem laufendem Projekt zur Zusammenführung von Bibliothekssystemen: Neues Bibliothekssystem erwartet Titeldaten in MARC21 und alle anderen Daten in CSV mit Senkrechtstrichen als Trennzeichen.

## Vergleich mit anderen Bibliothekssystemen

Kommerzielle Alternativen: Ex Libris Aleph, Ex Libris Alma, Explore, Kuali OLE, Winmedio etc.
  * Swiss Library Service Platform (SLSP) wird Alma (reines Cloud-Angebot, Server wird in Amsterdam stehen) einführen
  * OCLC WorldShare Management Service
  * größte Open-Source-Alternative in Entwicklung: FOLIO https://www.folio.org

Literaturempfehlung: Marshall Breeding (1.5.2019): Library Systems Report 2019. Cycles of innovation. In: American Libraries Magazine. https://americanlibrariesmagazine.org/2019/05/01/library-systems-report-2019/