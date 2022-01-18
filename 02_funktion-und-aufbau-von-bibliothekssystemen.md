# Funktion und Aufbau von Bibliothekssystemen

* Metadatenstandards in Bibliotheken (MARC21)
* Installation und Konfiguration von Koha
* Cloud-Konzepte am Beispiel von ALMA
* Marktüberblick Bibliothekssysteme

## Metadatenstandards in Bibliotheken (MARC21)

* MARC21: International verbreiteter Metadaten-Standard, begründet von der Library of Congress 1999: <https://www.loc.gov/marc/bibliographic/>
* Hat [eigenes Binärformat](http://format.gbv.de/marc/iso) (.mrc), gibt's aber auch [als XML](http://format.gbv.de/marc/xml)
* wegen unterschiedlicher Katalogisierungsregeln und der Möglichkeit eigene Felder zu belegen, weicht die Verwendung international und auch nach Institution [stark vom vermeintlichen Standard ab](https://docs.google.com/presentation/d/e/2PACX-1vRU4J_rln00UVD7pNPT0_02NOad0HfSk_UKqRI0v29y8QkMAplEDlyjc0Ot_VE_paV6WBW29Fh_V-iN/pub?start=false&loop=false&delayms=3000#slide=id.g574306292a_0_35)
* Koha und alle anderen großen Bibliothekssysteme basieren auf MARC21 oder unterstützen es als Austauschformat
* wird zukünftig voraussichtlich von [BIBFRAME](http://format.gbv.de/bibframe), einem Datenmodell basierend auf [RDF](http://format.gbv.de/rdf), abgelöst

### Übung: Vergleich MARC21 und Dublin Core

* Dublin Core ist ein Standard, der als kleinster gemeinsamer Nenner gilt
* Wir beziehen die Daten über die SRU-Schnittstelle von Swisscovery (auf das Thema Schnittstellen und SRU gehen wir an einem anderen Tag noch ein)

**Aufgabe (15 Minuten):** Laden Sie über die folgenden Links Daten über die SRU-Schnittstelle von Swisscovery einmal im Format MARC21 und einmal im Format Dublin Core und vergleichen Sie diese.

* MARC21: <https://swisscovery.slsp.ch/view/sru/41SLSP_NETWORK?version=1.2&operation=searchRetrieve&query=title=einstein&recordSchema=marcxml>
* Dublin Core: <https://swisscovery.slsp.ch/view/sru/41SLSP_NETWORK?version=1.2&operation=searchRetrieve&query=title=einstein&recordSchema=dc>

Note:
- Der Katalog Swisscovery beinhaltet die Daten der an SLSP teilnehmenden Bibliotheken.
- Der gemeinsame Katalog ermöglicht eine übergreifende Suche, gleichzeitig bietet Swisscovery auch Schnittstellen an, über welche Metadaten der teilnehmenden Institutionen zentral bezogen werden können.
- Siehe auch: [Nutzung SLSP-Metadaten](https://slsp.ch/de/metadata), [Dokumentation der SRU-Schnittstelle von ALMA](https://developers.exlibrisgroup.com/alma/integrations/sru/)

## Installation und Konfiguration von Koha

### Einführung in Koha

* Webseite: <https://koha-community.org>
* Weltweites Open Source Projekt, gegründet 1999 in Neuseeland, heute  mit Beteiligung von Unternehmen wie ByWater Solutions, Biblibre,  Catalyst IT, PTFS Europe, Theke Solutions
* Status des Projekts: Siehe [Statistik bei Open Hub](https://www.openhub.net/p/koha)

Note:
- Zur Gesundheit von Open-Source-Projekten siehe auch <https://felixlohmeier.de/slides/2017-09-28_vufind-anwendertreffen-keynote.html>
- Zur Bedeutung von Open-Source-Software auch dieser Comic: <https://xkcd.com/2347/>

#### Koha Dokumentation

* Professionelle Entwicklungsstrukturen, vgl. Dashboard: <https://dashboard.koha-community.org>
* Release Notes zur Version 21.05: <https://koha-community.org/koha-21-05-released/>
* Handbuch zur Version 21.05: [englisch](https://koha-community.org/manual/21.05/en/html/), [deutsch](http://koha-community.org/manual/21.05/de/html/index.html) (Übersetzung noch in Arbeit)

#### Koha Demo

* MARC21, Koha 21.05 bereitgestellt von schweizer Unternehmen "Admin Kuhn" unter http://koha.adminkuhn.ch
* Login mit Benutzername `demo` / Passwort `demo` möglich
* wird jeweils Morgens um 5 Uhr auf Standardwerte zurückgesetzt
* siehe auch die Erläuterungen unter http://adminkuhn.ch/wiki/Koha-Demoinstallation

### Installation von Koha 21.05

Die folgenden Befehle orientieren sich an der [offiziellen Installationsanleitung](http://wiki.koha-community.org/wiki/Debian).

#### Paketquellen für Koha registrieren

1. Paketquelle hinzufügen

```shell
echo 'deb http://debian.koha-community.org/koha 21.05 main' | sudo tee /etc/apt/sources.list.d/koha.list
```

2. Schlüssel hinzufügen

```shell
wget -q -O- http://debian.koha-community.org/koha/gpg.asc | sudo apt-key add -
```

3. Paketquellen aktualisieren

```shell
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
sudo a2enmod headers proxy_http 
sudo systemctl restart apache2
```

#### Eine Bibliothek in Koha erstellen

```shell
sudo koha-create --create-db bibliothek
```

#### Deutsche Übersetzung für Koha installieren

```shell
sudo koha-translate --install de-DE
```

Note:
- Fehlermeldung ignorieren:
  
  > `Connection to the memcached servers '__MEMCACHED_SERVERS__' failed`

#### "Plack" aktivieren für bessere Performance

```shell
sudo koha-plack --enable bibliothek
sudo koha-plack --start bibliothek
sudo systemctl restart apache2
```

#### Host-Datei ergänzen

Es handelt sich um einen einzigen Befehl. Anders als sonst müssen hier also alle vier Zeilen gemeinsam in die Kommandozeile übernommen werden.

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

Kopieren Sie das Passwort in die Zwischenablage.

#### Fertig?

Wenn die Installation erfolgreich war, dann sollten Sie mit dem Browser auf der virtuellen Maschine die Webseite <http://bibliothek-intra.meine-schule.org> aufrufen können. Dort sollte der Koha-Installationsassistent erscheinen.

#### Bekanntes Problem

Aus noch unbekannten Gründen ist manchmal nach erfolgreicher Installation und etwas Wartezeit plötzlich Koha nicht mehr aufrufbar. Dann hilft ein Neustart von Koha:

```
sudo systemctl restart koha-common
```

#### Koha zurücksetzen

Falls etwas schiefgeht, können Sie die Konfiguration mit den folgenden Befehlen zurücksetzen. Es erscheint dann wieder der Webinstaller und Sie können von Vorne beginnen.

```shell
sudo koha-remove bibliothek
sudo koha-create --create-db bibliothek
sudo koha-passwd bibliothek
```

Note:
- Falls das auch nicht funktioniert, ist vermutlich ein Rest der eingerichteten Bibliothek noch vorhanden. Mit folgenden Befehlen können Sie auch diese Reste löschen. Anschließend sollte das Neuanlegen funktionieren.
  - `sudo koha-remove --purge-all bibliothek`
  - `sudo userdel bibliothek-koha`

### Grundkonfiguration mit Tutorial

Wir verwenden ein Tutorial von Stephan Tetzel, das auf deutsch und englisch verfügbar ist:

* Deutsch: <https://zefanjas.de/wie-man-koha-installiert-und-fuer-schulen-einrichtet-teil-1/>
* Englisch: <https://openschoolsolutions.org/how-to-install-and-set-up-koha-for-schools-part-1/>

Note:
- Da wir eine neuere Koha-Version (21.05) als im Tutorial 20.05 verwenden, gibt es Abweichungen im Detail. Das ist eine Situation, die in der Praxis oft auftritt. Versuchen Sie die Hinweise im Tutorial sinngemäß anzuwenden.

**Aufgabe**: Bitte bearbeiten Sie das Tutorial, um die Grundkonfiguration von Koha vorzunehmen. Das Tutorial besteht aus 6 Kapiteln (die Links zu den weiteren Kapiteln sind immer am Anfang der Blogartikel):

1. Installation und Einrichtung einer ersten Bibliothek
  * Die Grundinstallation haben wir bereits durchgeführt. Starten Sie in [Kapitel 1](https://zefanjas.de/wie-man-koha-installiert-und-fuer-schulen-einrichtet-teil-1/) unter der Überschrift "Koha einrichten".
2. Das bibliografische Framework
  * Dieses Kapitel bitte nur lesen und den Export/Import **nicht** durchführen. Das im Tutorial beschriebene Vorgehen ist fehleranfällig.
3. Grundeinstellungen
  * Mit der Koha-Version 20.05 wurde der Parameter "OpacMainUserBlock" für die Willkommensnachricht von den Systemeinstellungen in das Nachrichten-Werkzeug verschoben (Werkzeuge > Nachrichten > Neuer Eintrag).

Optional:

4. Buchaufnahme
5. Drucken von Etiketten
6. Ausleihkonditionen

Note:
- Koha bietet eine Bearbeitungsfunktion des bibliografischen Frameworks direkt über die Webseite der Admin-Oberfläche (ohne Export/Import). Menüpunkt "MARC-Struktur".
- Der Parameter für die Willkommensnachricht wurde von den Systemeinstellungen in das Nachrichten-Werkzeug verschoben. Werkzeuge > Nachrichten > Neuer Eintrag. Anzeigebereich: OpacMainUserBlock

### Übung: Manuelle Bedienung

**Aufgabe (20 Minuten)**: Damit Sie ein Gespür für das System erhalten, machen wir nun ein Minimalbeispiel für einen vereinfachten Bibliotheksworkflow:

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

Note:
- Falls bei der Grundinstallation der Import des FA-Frameworks nicht durchgeführt wurde, steht keine Schnellaufnahme zur Verfügung.
- Nachinstallation des FA-Frameworks:
  1. Im Terminal das Framework herunterladen:
     ```bash
     wget https://raw.githubusercontent.com/sebastian-meyer/bain_fa/master/export_FA.csv
     ```
  2. In der Koha-Dienstoberfläche: Start -> Administration -> Bibliographisches MARC-Framework
  3. Button "Neues Framework": Code "FA", Beschreibung "Schnellaufnahme"
  4. Rechts neben dem neu angelegten Framework über den Pfeil auf "Import"
  5. Datei "export_FA.csv" auswählen und bestätigen

#### Benutzer anlegen

* Start > Benutzer > Benutzer-Schnellerfassung
* Hinzufügen Benutzer: Name und Ausweisnummer vergeben

#### Buch an Theke ausleihen

* Oben im Suchschlitz Reiter Ausleihe wählen, Ausweisnummer eingeben und abschicken
* Dann in Box "Ausleihe an" den Exemplarbarcode eingeben und Ausleihe abschicken
* Über Button "Zeige Ausleihen" prüfen, ob Ausleihe erfolgreich war

#### Buch an Theke zurücknehmen

* Oben im Suchschlitz Reiter Rückgabe wählen, Barcode eingeben und abschicken

### Übung: Datenimport

**Aufgabe (20 Minuten)**: Koha verfügt über einige Schnittstellen. Hier ein kleines Beispiel für semi-automatische Erfassung ("copy cataloging"):

1. Z39.50 Server einrichten
2. "Copy Cataloging"
3. Datenexport

#### SRU Server einrichten

Start > Administration > Z39.50/SRU-Server / Neuer SRU-Server

* Servername: `GBV`
* Hostname: `sru.gbv.de`
* Port: `80`
* Ausgewählt (Standardsuche): ja
* Datenbank: `gvk`
* Syntax: `MARC21/USMARC`
* Codierung: `utf8`

Note:
- Im Netzwerk der FHGR sind aus Sicherheitsgründen einige Ports gesperrt. Daher können wir mit unserer virtuellen Maschine einige Z39.50 Server wie z.B. von NEBIS auf Port 9909 nicht erreichen.

#### "Copy Cataloging"

Start > Katalogisierung > Import über Z39.50/SRU

* Nach etwas suchen (z.B. Titel: `open educational resources`)
* Bei gewünschtem Eintrag Aktionen > Import auswählen (oder vorher Vorschau prüfen, ob es der richtige Titel ist).
* Im folgenden Katalogisierungsbildschirm können Sie versuchen zu speichern. Es muss aber auf jeden Fall noch der Medientyp in Feld `942c` ausgewählt werden (ein Pflichtfeld).
* Im nächsten Bildschirm einen Barcode vergeben und Exemplar hinzufügen.

### Exkurs: Datenexport und Schnittstellen

* Koha unterstützt dateibasierten Datenexport und diverse Schnittstellen.
* Wir nutzen hier die Schnittstelle OAI-PMH.
* OAI-PMH steht für [Open Archives Initiative Protocol for Metadata Harvesting](https://www.openarchives.org/pmh/) und ermöglicht regelmäßiges automatisiertes Abrufen von Änderungen.
* Im Themenblock "Metadaten modellieren und Schnittstellen nutzen" gehen wir noch genauer darauf ein.

Note:
- Vorab: Was nützt OAI-PMH meiner Bibliothek?
  - Abruf der Daten zur Weiterverarbeitung (z. B. Discovery-System, Digitalisierung)
  - Erstellung von z. B. Regionalbibliografien oder Themenportalen
  - Aggregation für Verbundrecherchen
  - Datenbereitstellung für Digitalisierung, Hackathons, etc.

### Übung: OAI-PMH

**Aufgabe (20 Minuten)**: Aktivieren Sie die OAI-PMH-Schnittstelle und prüfen Sie, ob die von Ihnen erstellten Datensätze darüber abrufbar sind

#### Schnittstelle einrichten

Start > Administration > Globale Systemparameter > Web Services
* OAI-PMH: Aktiviere
* OAI-PMH:AutoUpdateSets: Aktiviere
* Button "Alle Web Services Parameter speichern"
* Siehe auch: <https://koha-community.org/manual/21.05/en/html/administration.html#oai-sets-configuration>

#### Schnittstelle abfragen

* Die Basisurl lautet bei uns: <http://bibliothek.meine-schule.org/cgi-bin/koha/oai.pl>
* Klicken Sie oben auf die Links "Identify", "Metadata Formats" usw.
* Prüfen Sie, ob die von Ihnen erstellten Katalogeinträge abrufbar sind

### Literatur

* Koha Anwenderhandbuch des Bibliothekservice-Zentrum Baden-Württemberg: <https://wiki.bsz-bw.de/display/KOHA/Dokumentation> (für ältere Versionen geschrieben)
* Felix Hemme (2016): Katalogisierung mit dem Open-Source-Bibliothekssystem Koha – unter Berücksichtigung des Metadatenstandards MARC 21 und dem Regelwerk RDA. Bachelorarbeit im Studiengang Bibliotheksmanagement der FH Potsdam. <https://nbn-resolving.org/urn:nbn:de:kobv:525-13882>
* Implementation Checklist: <https://koha-community.org/manual/21.05/en/html/implementation_checklist.html>
* Fred King: How to use Koha, MarcEdit, a Raspberry Pi, and a Chicken  (optional) to create an ILS for under $100 (September 2019, Vortrag auf  Koha-Konferenz): <http://avengingchicken.online/misc/installing_koha_on_raspberry-pi-4.pdf>

## Cloud-Konzepte am Beispiel von ALMA

### Verwendung von ALMA an der Fachhochschule Nordwestschweiz (FHNW)

Notizen zur Live-Demo:

* Aufbau und Grundlagen: jede SLSP-Bibliothek hat eigene Einstiegsseite in ALMA-Administration
* Recherche in Alma / Primo VE: Komplexe Suchoptionen möglich, Anzeige der Treffer ähnlich wie in Discovery-System
* Ausleihe und Rückgabe: System verlangt zunächst "Login" an einem Standort, bevor Benutzungsfunktionen angezeigt werden
* Benutzerverwaltung: SLSP hat Rollenvorlagen für Mitgliedsbibliotheken erstellt
* E-Ressourcen:
  * Übernahme von Daten aus verschiedenen Schnittstellen möglich. Die meisten Verlage liefern Daten direkt an Ex Libris.
  * Bestandszeitraum kann "überschrieben" werden
  * Datenbanken können oft auch im Volltext durchsucht werden.
* Konfiguration:
  * Öffnungszeiten bestimmen den Ablauf der Ausleihfristen. Kann für jede Bibliothek definiert werden.
  * Die meisten Einstellungen werden an der FHNW auf der Ebene der "Institution Zone" vorgenommen. Beispiel "Briefe" (inkl. E-Mail) zur Nutzerkommunikation
  * Discovery kann direkt aus ALMA konfiguriert werden. Template (HTML, CSS, JS) kann mit "Primo Studio" erstellt werden. <https://fhnw.swisscovery.slsp.ch>
* Benutzerverwaltung: SLSP hat Rollenvorlagen für Mitgliedsbibliotheken erstellt

### Zusammenspiel Verbund und lokale Änderungen

> Was passiert, wenn Datensätze in der Community aktualisiert werden, für die lokale "Überschreibungen" vorgenommen wurden?

Lokale Änderung wird überschrieben und in einer Liste (CZ-Updates - Aufgabenliste) zur Kontrolle notiert

### Übung: Strategische Spielereien

Gruppe 1: Argumentation gegenüber Träger / Direktion
* Ihr müsst eurer Direktion / dem Träger ein Systemwechsel zu ALMA / SLSP vorschlagen, welche Argumente führt ihr auf?
* Wie rechtfertigen wir den sehr viel höheren Mitteleinsatz gegenüber den Trägern und der Direktion?
* Seht Ihr Alternativen?

Gruppe 2: Motivation und Kommunikation der beteiligten Bibliotheken
* Wie würdet Ihr die Bibliotheken miteinbeziehen?
* Wie würdet Ihr den Change begleiten?
* Welche Kommunikationskanäle würdet Ihr nutzen?

Gruppe 3: Technische Alternativen Pro und Contra
* Welche Vor- und Nachteile gibt es bei einem cloudbasierten System?
* Gibt es Alternativen zu ALMA / SLSP
* Wie beurteilt ihr die Konfigurationsmöglichkeiten?

## Marktüberblick Bibliothekssysteme

### Statistiken zum Markt USA/UK

* Marshall Breeding veröffentlicht jährlich im American Libraries Magazine den "Library Systems Report" und erfasst dafür regelmäßig Statistiken. Daran lässt sich die internationale Entwicklung der Produkte am ehesten ablesen.
  * [Zusammenfassende Tabellen mit aktuellen Statistiken (2020)](https://americanlibrariesmagazine.org/wp-content/uploads/2021/04/Library-Systems-Report-2021-Tables-and-Charts.xlsx)
  * Vollständiger Bericht: Marshall Breeding (3.5.2021): Library Systems Report 2021. Advancing library technologies in challenging times. In: American Libraries Magazine. https://americanlibrariesmagazine.org/2021/05/03/2021-library-systems-report/

Note:
- kurz nach Erscheinen des Berichts wurde ProQuest/ExLibris von Clarivate aufgekauft
  - Sachliche Einordnung: https://americanlibrariesmagazine.org/blogs/the-scoop/clarivate-to-acquire-proquest/
  - zugespitzter Kommentar: https://librarianshipwreck.wordpress.com/2021/08/16/mergers-acquisitions-and-my-tinfoil-hat/
- Übersicht über vergangene Fusionen und Aufkäufe: https://librarytechnology.org/mergers/

### Alma im Vergleich zu Aleph und Koha

* Eine Stärke von Alma ist das ERM (Electronic Resource Management). Aleph und Koha verfügen über kein integriertes ERM.
  * Siehe dazu Vortrag von Katrin Fischer: [Koha und ERM - Optionen für die Verwaltung von elektronischen Ressourcen](https://nbn-resolving.org/urn:nbn:de:0290-opus4-35840) auf dem Bibliothekartag 2018.
* Alma ist auf dem aktuellsten Stand der Technik und bietet vorbildliche Programmierschnittstellen.
* Alma ist cloudbasiert, d.h. zentrale Installation auf Servern von Ex Libris und regelmäßige Updates.
* Kritiker befürchten langfristig Nachteile durch die Abhängigkeit vom Hersteller Ex Libris und dessen Marktmacht (Vendor Lock-in).

### Wann wird ein ERM-System benötigt?

* Klassische Bibliothekssysteme können auch einzelne E-Books, digitale Hörbücher etc. verwalten
* Manchmal werden Schnittstellen angeboten, um eBooks aus großen Plattformen wie OverDrive zu übernehmen
* ERM-Systeme benötigen insbesondere wissenschaftliche Bibliotheken, weil diese "Pakete" von verschiedenen Anbietern erwerben, in denen eine so große Anzahl von elektronischen Zeitschriften und/oder E-Books enthalten ist, dass diese nicht mehr einzeln katalogisiert werden.

### Unterschiede zwischen wiss. und öff. Bibliothekssoftware

- Traditionell gibt es große Unterschiede zwischen wissenschaftlichen und öffentlichen Bibliotheken (darunter Schulbibliotheken)
- Bibliotheksmanagementsoftware für öffentliche Bibliotheken enthält oft Module für Veranstaltungsmanagement oder Content-Management (Webseiten), legt Schwerpunkte auf optischer Darstellung (Buchcover, Themenschwerpunkte) und bindet Plattformen für E-Books und Hörbücher ein.
- Bibliotheksmanagementsoftware für wissenschaftliche Bibliotheken legt Schwerpunkte auf Erschließung, E-Ressourcen-Management (elektronische Zeitschriften) und komplexe Geschäftsgänge

## Aufgaben

Bis zum nächsten Termin:

1. Beitrag im Lerntagebuch zu dieser Lehreinheit (3000 - 4000 Zeichen)
2. Installation ArchivesSpace (siehe unten)

### Installation ArchivesSpace 3.1.0

1. Java 8 installieren

    ```bash
    sudo apt update
    sudo apt install openjdk-8-jre-headless
    ```

2. Zip-Archiv herunterladen und entpacken

    ```bash
    wget https://github.com/archivesspace/archivesspace/releases/download/v3.1.0/archivesspace-v3.1.0.zip
    unzip -q archivesspace-v3.1.0.zip
    ```

3. ArchivesSpace starten

    ```bash
    archivesspace/archivesspace.sh
    ```

Note:
- Während Koha in der Standardinstallation so eingerichtet ist, dass es automatisch beim Systemstart zur Verfügung steht, muss ArchivesSpace in der Standardinstallation manuell gestartet werden.
- Es ist nur solange verfügbar wie der Prozess im Terminal läuft. Es handelt sich um eine Webanwendung. Im Terminal läuft die Server-Applikation. Über den Browser greifen wir darauf zu. Wenn das Terminal geschlossen wird, dann wird auch der Server beendet und die Webseite im Browser ist nicht mehr erreichbar.

### ArchivesSpace aufrufen

Nach ein paar Minuten sollte ArchivesSpace unter folgenden URLs erreichbar sein:

* http://localhost:8080/ – Administrationsoberfläche / "Staff Interface"
* http://localhost:8081/ – Benutzungsoberfläche / "Public Interface"
* http://localhost:8082/ – OAI-PMH Schnittstelle

Zugangsdaten für das "Staff Interface" sind:

* Username: `admin`
* Password: `admin`

Note:
- Die Benutzungsoberfläche ist erst verfügbar, wenn über die Administrationsoberfläche mindestens ein Repository angelegt wurde. (Das machen wir in der nächsten Lehreinheit.)
- Da es sich um eine lokale Installation handelt, sind die Adressen nur über den Webbrowser innerhalb der Virtuellen Maschine erreichbar.
- Für technisch Interessierte:
  - Unter http://localhost:8089/ ist die [REST API](https://archivesspace.github.io/archivesspace/api/) erreichbar.
  - Unter http://localhost:8090/ ist die Suchmaschine Apache Solr erreichbar.
