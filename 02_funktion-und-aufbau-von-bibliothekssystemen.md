# Funktion und Aufbau von Bibliothekssystemen

* Metadatenstandards in Bibliotheken (MARC21)
* Installation und Konfiguration von Koha
* Marktüberblick Bibliothekssysteme

## Metadatenstandards in Bibliotheken (MARC21)

* MARC21: International verbreiteter Metadaten-Standard, begründet von der Library of Congress 1999: <https://www.loc.gov/marc/bibliographic/>
* Hat ein [eigenes Binärformat](http://format.gbv.de/marc/iso) (.mrc), gibt's aber auch [als XML](http://format.gbv.de/marc/xml)
* wegen unterschiedlicher Katalogisierungsregeln und der Möglichkeit eigene Felder zu belegen, weicht die Verwendung international und auch nach Institution [stark vom vermeintlichen Standard ab](https://docs.google.com/presentation/d/e/2PACX-1vRU4J_rln00UVD7pNPT0_02NOad0HfSk_UKqRI0v29y8QkMAplEDlyjc0Ot_VE_paV6WBW29Fh_V-iN/pub?start=false&loop=false&delayms=3000#slide=id.g574306292a_0_35)
* wird zukünftig voraussichtlich von [BIBFRAME](http://format.gbv.de/bibframe), einem Datenmodell basierend auf [RDF](http://format.gbv.de/rdf), abgelöst
* Koha und alle anderen großen Bibliothekssysteme basieren auf MARC21 oder unterstützen es als Austauschformat

### Vergleich MARC21 und Dublin Core

* Dublin Core ist ein Standard, der als kleinster gemeinsamer Nenner gilt
* Als Beispiele nutzen wir den Katalog der Bibliothek der FH Graubünden
* Wir beziehen die Daten über die SRU-Schnittstelle von Swissbib (auf das Thema Schnittstellen und SRU gehen wir an einem anderen Tag noch ein)

**Aufgabe (15 Minuten)**: Laden Sie über das Formular auf der Webseite http://sru.swissbib.ch Daten mit den folgenden Parametern einmal im Format MARC21 und einmal im Format Dublin Core und vergleichen Sie diese.

| Searchfield              | value         |
| ------------------------ | ------------- |
| dc.possessingInstitution | `E27`         |
| dc.title                 | `open access` |

Note:

- Das Projekt Swissbib sammelt Metadaten aller schweizer Universitätsbibliotheken, der Nationalbibliothek und einiger Kantonsbibliotheken sowie weiterer Institutionen.
- Der gemeinsame Katalog ermöglicht eine übergreifende Suche, gleichzeitig bietet Swissbib auch Schnittstellen an, über welche Metadaten der teilnehmenden Institutionen zentral bezogen werden können.
- Siehe auch: [Dokumentation Swissbib SRU](http://www.swissbib.org/wiki/index.php?title=SRU)

## Installation und Konfiguration von Koha

### Einführung in Koha

* Webseite: <https://koha-community.org>
* Weltweites Open Source Projekt, gegründet 1999 in Neuseeland, heute  mit Beteiligung von Unternehmen wie ByWater Solutions, Biblibre,  Catalyst IT, PTFS Europe, Theke Solutions
* Status des Projekts: Siehe [Statistik bei Open Hub](https://www.openhub.net/p/koha)

#### Koha Dokumentation

* Professionelle Entwicklungsstrukturen, vgl. Dashboard: <https://dashboard.koha-community.org>
* Release Notes zur Version 19.11: <https://koha-community.org/koha-19-11-release/>
* Handbuch zur Version 19.11: [englisch](https://koha-community.org/manual/19.11/en/html/), [deutsch](http://koha-community.org/manual/19.11/de/html/index.html) (noch nicht vollständig übersetzt)

#### Koha Demo

* MARC21, Koha 19.11 bereitgestellt von schweizer Unternehmen "Admin Kuhn" 
  * [OPAC](http://koha.adminkuhn.ch/)
  * [Staff Interface](http://koha.adminkuhn.ch:8080/) (Benutzername `demo` / Passwort `demo`)

### Installation von Koha 19.11

Die folgenden Befehle orientieren sich an der [offiziellen Installationsanleitung](http://wiki.koha-community.org/wiki/Debian).

#### Paketquellen für Koha registrieren 

```shell
echo 'deb http://debian.koha-community.org/koha 19.11 main' | sudo tee /etc/apt/sources.list.d/koha.list
wget -q -O- http://debian.koha-community.org/koha/gpg.asc | sudo apt-key add -
sudo apt-get update 
```

#### Koha und die Datenbank MariaDB installieren 

```shell
sudo apt install koha-common mariadb-server
```

#### Domain `meine-schule.org` für Koha konfigurieren 

```shell
sudo sed -i 's/DOMAIN=".myDNSname.org"/DOMAIN=".meine-schule.org"/' /etc/koha/koha-sites.conf
```

#### Apache Konfiguration 

```shell
sudo a2enmod rewrite
sudo a2enmod cgi
sudo service apache2 restart
```

#### Eine Bibliothek in Koha erstellen 

```shell
sudo koha-create --create-db bibliothek
```

#### Deutsche Übersetzung für Koha installieren 

```shell
sudo koha-translate --install de-DE
```

#### Host-Datei ergänzen

```shell
echo '# Koha
127.0.0.1 bibliothek.meine-schule.org
127.0.0.1 bibliothek-intra.meine-schule.org
' | sudo tee -a /etc/hosts
```

#### Befehl, um generiertes Passwort herauszufinden 

```shell
sudo koha-passwd bibliothek
```

#### Fertig?

Wenn die Installation erfolgreich war, dann sollten Sie mit dem Browser auf dem virtuellen Server die Webseite http://bibliothek-intra.meine-schule.org aufrufen können. Dort sollte der Koha-Installationsassistent erscheinen.

### Grundkonfiguration mit Tutorial

Wir verwenden ein Tutorial von Stephan Tetzel, das auf deutsch und englisch verfügbar ist:

* Deutsch: <https://zefanjas.de/wie-man-koha-installiert-und-fuer-schulen-einrichtet-teil-1/> 
* Englisch: <https://openschoolsolutions.org/how-to-install-and-set-up-koha-for-schools-part-1/> 

**Aufgabe (45 Minuten)**: Bitte bearbeiten Sie das Tutorial, um die Grundkonfiguration von Koha vorzunehmen. Das Tutorial besteht aus 6 Kapiteln (die Links zu den weiteren Kapiteln sind immer am Anfang der Blogartikel):

1. Installation und Einrichtung einer ersten Bibliothek
  * Die im Tutorial erwähnte Grundinstallation haben wir oben bereits  durchgeführt. Bitte starten Sie in Kapitel 1 unter der Überschrift "Koha  einrichten": <https://zefanjas.de/wie-man-koha-installiert-und-fuer-schulen-einrichtet-teil-1/>
2. Das bibliografische Framework
  * Hier bitte nur lesen, den Export/Import nicht durchführen.
3. Grundeinstellungen
4. Buchaufnahme
5. Drucken von Etiketten
6. Ausleihkonditionen

### Manuelle Bedienung

**Aufgabe (15 Minuten)**: Damit Sie ein Gespür für das System erhalten, machen wir nun ein Minimalbeispiel für einen vereinfachten Bibliotheksworkflow:

1. Buch erfassen
2. Benutzer anlegen
3. Buch an Theke ausleihen
4. Buch an Theke zurücknehmen

Schauen Sie sich dabei auch ein wenig um, welche Optionen das Bibliothekssystem Koha bietet.

#### Buch erfassen

Start > Katalogisierung > Neuer Titel > Schnellaufnahme

1. Neuer Marc Datensatz: Pflichtfelder ausfüllen
  * `000` und `008` werden automatisch befüllt beim Anklicken
  * In `245a` muss ein Titel vergeben werden
2. Exemplar hinzufügen
  * `p - Barcode` muss vergeben werden (sonst können wir später nicht ausleihen)
  * Unten Button "Exemplar hinzufügen" nicht vergessen

#### Benutzer anlegen

* Start > Benutzer > Benutzer-Schnellerfassung
* Hinzufügen Benutzer: Name und Ausweisnummer vergeben

#### Buch an Theke ausleihen

* Oben im Suchschlitz Reiter Ausleihe wählen, Ausweisnummer eingeben und abschicken
* Dann in Box "Ausleihe an" den Exemplarbarcode eingeben und Ausleihe abschicken

#### Buch an Theke zurücknehmen

* Oben im Suchschlitz Reiter Rückgabe wählen, Barcode eingeben und abschicken

### Datenimport und Export

**Aufgabe (15 Minuten)**: Koha verfügt über einige Schnittstellen. Hier ein kleines Beispiel für semi-automatische Erfassung ("copy cataloging"):

1. Z39.50 Server einrichten
2. "Copy Cataloging"
3. Datenexport

#### Z39.50 Server einrichten

Start > Administration > Z39.50/SRU-Server / Neuer Z39.50-Server

* Servername: `NEBIS`
* Hostname: `opac.nebis.ch`
* Port: `9909`
* Ausgewählt (Standardsuche): ja
* Datenbank: `NEBIS`
* Syntax: `MARC21/USMARC`
* Codierung: `MARC-8`

#### "Copy Cataloging"

Start > Katalogisierung > Import über Z39.50/SRU

* Nach etwas suchen (z.B. Titel: `open educational resources`)
* Bei gewünschtem Eintrag Aktionen > Import auswählen (oder vorher Vorschau prüfen, ob es der richtige Titel ist).
* Im folgenden Katalogisierungsbildschirm können Sie versuchen zu speichern. Es muss aber auf jeden Fall noch der Medientyp in Feld `942c` ausgewählt werden (ein Pflichtfeld).
* Im nächsten Bildschirm einen Barcode vergeben und Exemplar hinzufügen.

#### Datenexport

Start > Werkzeuge > Datenexport

* Dateiformat: `XML`
* Dateiname: `koha.xml`
* Download speichern (landet im Ordner `/home/bain/Downloads`)

### Literatur

* Koha Anwenderhandbuch des Bibliothekservice-Zentrum Baden-Württemberg: <https://wiki.bsz-bw.de/doku.php?id=l-team:koha:koha-handbuch:start> (für ältere Versionen geschrieben)
* Felix Hemme (2016): Katalogisierung mit dem Open-Source-Bibliothekssystem Koha – unter Berücksichtigung des Metadatenstandards MARC 21 und dem Regelwerk RDA. Bachelorarbeit im Studiengang Bibliotheksmanagement der FH Potsdam. <https://nbn-resolving.org/urn:nbn:de:kobv:525-13882>
* Implementation Checklist: <https://koha-community.org/manual/19.11/en/html/implementation_checklist.html>
* Fred King: How to use Koha, MarcEdit, a Raspberry Pi, and a Chicken  (optional) to create an ILS for under $100 (September 2019, Vortrag auf  Koha-Konferenz): <http://avengingchicken.online/misc/installing_koha_on_raspberry-pi-4.pdf>

## Marktüberblick Bibliothekssysteme

### Statistiken zum Markt USA/UK

* Marshall Breeding veröffentlicht jährlich im American Libraries Magazine den "Library Systems Report" und erfasst dafür regelmäßig Statistiken. Daran lässt sich die internationale Entwicklung der Produkte am ehesten ablesen.
  * [Zusammenfassende Tabellen mit aktuellen Statistiken (2019)](https://americanlibrariesmagazine.org/wp-content/uploads/2019/04/2019-Library-Systems-Report-Tables-UPDATED.pdf)
  * Vollständiger Bericht: Marshall Breeding (1.5.2019): Library Systems Report 2019. Cycles of innovation. In: American Libraries Magazine. <https://americanlibrariesmagazine.org/2019/05/01/library-systems-report-2019/>

### Aktuelle Entwicklungen

* Swiss Library Service Platform (SLSP) wird Alma (reines Cloud-Angebot, Server wird in Amsterdam stehen) einführen
* Größte Open-Source-Alternative in Entwicklung: [FOLIO](https://www.folio.org)

### Alma im Vergleich zu Aleph und Koha

* Eine Stärke von Alma ist das ERM (Electronic Resource Management). Aleph und Koha verfügen über kein integriertes ERM.
  * Siehe dazu Vortrag von Katrin Fischer: [Koha und ERM - Optionen für die Verwaltung von elektronischen Ressourcen](https://nbn-resolving.org/urn:nbn:de:0290-opus4-35840) auf dem Bibliothekartag 2018.
* Alma ist auf dem aktuellsten Stand der Technik und bietet vorbildliche Programmierschnittstellen.
* Alma ist cloudbasiert, d.h. zentrale Installation auf Servern von Ex Libris und regelmäßige Updates.
* Kritiker befürchten langfristig Nachteile durch die Abhängigkeit vom Hersteller Ex Libris und dessen Marktmacht (Vendor-Lock-in).
