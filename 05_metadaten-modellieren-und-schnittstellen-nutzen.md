# Metadaten modellieren und Schnittstellen nutzen

1. Zwischenstand (Schaubild)
2. Austauschprotokolle für Metadaten (OAI-PMH, SRU)
3. Metadaten über OAI-PMH harvesten mit VuFindHarvest
4. XSLT Crosswalks mit MarcEdit
5. Transformation von Metadaten mit OpenRefine
6. Metadatenstandard LIDO
7. Weitere Tools zur Metadatentransformation
8. Nutzung von JSON-APIs

## Zwischenstand (Schaubild)

![Schaubild zu Lehrinhalten](images/05_schaubild-v3.png)

Note:

* Anders als in Lektion 1 geplant, nutzen wir als OAI Harvester VuFindHarvest statt metha. Das Schaubild wurde entsprechend aktualisiert.
* MarcEdit verfügt auch über eine Funktionalität, um OAI-PMH direkt zu harvesten. Zur besseren Illustration der Prozesse verwenden wir hier verschiedene Tools.
* Außerdem werden wir zusätzlich noch aus tabellarischen Beispieldaten (CSV) mit Hilfe der Software OpenRefine MARC21-XML modellieren.

## Austauschprotokolle für Metadaten (OAI-PMH, SRU)

Es gibt zahlreiche Übertragungsprotokolle im Bibliotheks- und Archivbereich. Drei davon sind besonders weit verbreitet:

* [Z39.50](https://www.loc.gov/z3950/agency/) (Library of Congress)
* [SRU](https://www.loc.gov/sru) - Search/Retrieve via URL (Library of Congress)
* [OAI-PMH](https://www.openarchives.org/pmh/) - Open Archives Initiative Protocol for Metadata Harvesting (Open Archives Initiative)

Note:
* Z39.50 ist sehr alt, aber immer noch im Einsatz. Meist wird das modernere SRU als Ergänzung angeboten.
* Während Z39.50 und SRU sich besonders für Live-Abfragen oder gezielten Datenabruf mit vielen Parametern eignet, zielt OAI-PMH vor allem auf größere Datenabzüge und regelmäßige Aktualisierungen.
* Das Schöne an SRU und OAI-PMH ist, dass die Anfragen als Internetadresse (URL) zusammengestellt werden können und direkt über den Browser ohne Zusatzsoftware aufrufbar sind.

## Metadaten über OAI-PMH harvesten mit VuFindHarvest

* Wir "ernten" (harvesten) die über die OAI-PMH-Schnittstellen angebotenen Daten
* Dazu verwenden wir das Tool [VuFindHarvest](https://github.com/vufind-org/vufindharvest), ein OAI Harvester aus dem VuFind-Projekt.
* Vorgehen:
  1. Sicherstellen, dass die OAI-PMH-Endpoints für Koha, ArchivesSpace und DSpace verfügbar sind
  2. Mit dem Tool die Daten abrufen und als XML auf der Festplatte speichern

### ArchivesSpace Fehlerkorrektur

* Wir haben beim Testen vorab festgestellt, dass die "Prudence Wayland Smith Papers" einen Erschließungsfehler beinhalten, der die Ausgabe als EAD über die OAI-PMH-Schnittstelle blockiert.
* Falls Sie diese EAD-Daten importiert hatten:
  * Resource "Prudence Wayland-Smith Papers" aufrufen
  * Im Bearbeitungsmodus nach `Language Note` Ausschau halten. Darin ist fehlerhafter HTML-Code.
  * Diese Note löschen.

### OAI-PMH Endpoints

* Koha sollte noch laufen
  * <http://bibliothek.meine-schule.org/cgi-bin/koha/oai.pl>
  * Format: `marcxml`
* ArchivesSpace muss ggf. gestartet werden
  * <http://localhost:8082> (Meldung `Parameter required but no value provided` ist OK)
  * Format: `oai_ead`
* DSpace Demo wird jede Samstag Nacht gelöscht
  * <http://demo.dspace.org/oai/request>
  * Format: `oai_dc`
  * Set: `com_10673_1` (Sample Community)

### VuFindHarvest 4.0.1 installieren

* Die Software wird bei GitHub veröffentlicht: <https://github.com/vufind-org/vufindharvest>
* Sie ist in PHP geschrieben. Für die Installation wird composer (Paketverwaltung für PHP) empfohlen.

```bash
sudo apt update
sudo apt install composer php php-xml
cd ~
wget https://github.com/vufind-org/vufindharvest/archive/v4.0.1.zip
unzip v4.0.1.zip
cd vufindharvest-4.0.1
composer install
```

### Übung: Harvesting

**Gruppenarbeit (20 Minuten)**

* Laden Sie mit VuFindHarvest die Daten aus
  * a) Koha http://bibliothek.meine-schule.org/cgi-bin/koha/oai.pl im Format `marcxml`
  * b) ArchivesSpace http://localhost:8082 im Format `oai_ead`
  * c) DSpace http://demo.dspace.org/oai/request das Set `com_10673_1` im Format `oai_dc`
* Hinweise:
  * Benutzungshinweise in der [README.md](https://github.com/vufind-org/vufindharvest#usage)
  * Speichern Sie die Daten in verschiedenen Ordnern.
* Beispiel:

```bash
cd ~/vufindharvest-4.0.1
php bin/harvest_oai.php --url=http://example.com/oai_server --metadataPrefix=oai_dc my_target_dir
```

## XSLT Crosswalks mit MarcEdit

* Wir haben in der vorigen Übung Daten in verschiedenen Formaten (MARC21-XML, EAD und DC) geladen.
* Nun werden wir diese einheitlich in MARC21-XML konvertieren.

### Crosswalks? XSLT?

* Crosswalks
  * Gängiger Begriff, um die Konvertierung von einem Metadatenstandard in einen anderen zu beschreiben.
  * Beispiel: MARC21 zu Dublin Core.
  * Der "Crosswalk" beinhaltet Regeln wie Elemente und Werte zugeordnet/verändert werden müssen (sog. Mapping).
  * Im Idealfall verlustfrei, aber meist keine 1:1-Zuordnung möglich.
* XSLT
  * Programmiersprache zur Transformation von XML-Dokumenten (W3C Empfehlung, 1999)
  * Literaturempfehlung für Einstieg in XSLT: <https://programminghistorian.org/en/lessons/transforming-xml-with-xsl>

### MarcEdit 7 installieren

* MarcEdit ist eine kostenlos nutzbare Software aber nicht Open Source.
* Sie ist die meistgenutzte Zusatzsoftware für die Arbeit mit MARC21.
* Offizielle Webseite: <https://marcedit.reeset.net>
* Installation von Mono (MarcEdit ist in .NET geschrieben und benötigt unter Linux diese Laufzeitumgebung) und des Unicode Fonts "Noto":

```bash
sudo apt install mono-complete fonts-noto
```

* Installation von MarcEdit:

```bash
cd ~
wget https://marcedit.reeset.net/software/marcedit7/marcedit7.run
chmod +x marcedit7.run
mkdir ~/marcedit
./marcedit7.run --target ~/marcedit
```

### MarcEdit konfigurieren

* Der Installer hat das Programm MarcEdit im Startmenü (unten links) registriert. Starten Sie darüber das Programm.
* Achtung: Die Voreinstellungen in der Linux-Version von MarcEdit sind fehlerhaft. Sie können wie folgt korrigiert werden:
  * MARC Tools
  * Button Tools / Edit XML Function List
  * Für alle benötigten Funktionen:
    * Im Menü "Defined Functions" die gewünschte Funktion auswählen und Modify klicken
    * Unter XSLT/XQuery Path `XSLT\` durch `xslt/` ersetzen
    * Anschließend "Save" und für nächste Funktion wiederholen

### XSLT Crosswalks anwenden

**Aufgabe (20 Minuten)**

* Konvertieren Sie einige Daten aus ArchivesSpace (EAD) und aus DSpace (DC) nach MARC21XML. Speichern Sie die Daten auf der Festplatte.
* Prüfen Sie grob, ob die konvertierten Daten korrekt aussehen.
* Anleitung für "XML Conversion" mit MarcEdit von der Unibibliothek aus Illinois: <https://guides.library.illinois.edu/c.php?g=463460&p=3168159>

Note:

* Von MarcEdit verwendete XSLT Dateien liegen auch hier: <https://github.com/reeset/marcedit_xslt_files> und <https://github.com/reeset/marcedit-xslts>

### Zur Vertiefung

**Optionale Aufgabe (2 Stunden)**

* Bearbeiten Sie die [Lehrmaterialien von Library Carpentry zu MarcEdit](https://librarycarpentry.org/lc-marcedit/01-introduction/index.html)

## Transformation von Metadaten mit OpenRefine

### Installation OpenRefine 3.4.1

1. Auf der Seite [Download](https://openrefine.org/download.html) das "Linux kit" herunterladen
    ```bash
    cd ~
    wget https://github.com/OpenRefine/OpenRefine/releases/download/3.4.1/openrefine-linux-3.4.1.tar.gz
    ```
2. Das Tar-Archiv entpacken
    ```bash
    tar -xzf openrefine-linux-3.4.1.tar.gz
    ```
3. In den entpackten Ordner wechseln und dort im Terminal den Befehl "./refine" aufrufen
    ```bash
    cd ~/openrefine-3.4.1
    ./refine
    ```
4. Nach ca. 15 Sekunden sollte sich der Browser öffnen. Falls nicht, manuell Firefox starten und <http://localhost:3333> eingeben.

Note:
* OpenRefine benötigt JAVA. Das haben wir schon auf unserer virtuellen Maschine, weil wir es für ArchivesSpace installiert hatten.
* `./` ist unter Linux eine Abkürzung für "in diesem Verzeichnis". Einfach nur `refine` reicht hier nicht aus, weil das Terminal dann nicht sicher weiß, ob Sie einen systemweit installierten Befehl `refine` oder die Datei `refine` im aktuellen Verzeichnis meinen. Daher muss zum Ausführen von Dateien im selben Verzeichnis das `./` vorangestellt werden.

### Übung Library Carpentry Lesson

**Aufgabe (4 Stunden)**

* Bearbeiten Sie die [Lehrmaterialien von Library Carpentry zu OpenRefine](https://librarycarpentry.org/lc-open-refine/)

## Metadatenstandard LIDO

## Weitere Tools zur Metadatentransformation

## Nutzung von JSON-APIs