# Suchmaschinen und Discovery-Systeme

* Installation und Konfiguration von VuFind
* Funktion von Suchmaschinen am Beispiel von Solr
* Übung zur Datenintegration
* Marktüberblick Discovery-Systeme
* Zwischenfazit

## Installation und Konfiguration von VuFind

* VuFind Internetseite: <https://vufind.org>
* VuFind Code bei GitHub: <https://github.com/vufind-org/vufind>
* Deutsche VuFind Anwendergemeinschaft: <https://vufind.de>
* Präsentation “10 Jahre VuFind” (2017): <https://felixlohmeier.de/slides/2017-09-28_vufind-anwendertreffen-keynote.html>
* VuFind-Installationen weltweit: <https://vufind.org/wiki/community:installations>
  * Beispiel TU Hamburg: <https://katalog.tub.tuhh.de>
  * Beispiel UB Leipzig: <https://katalog.ub.uni-leipzig.de>

### Installation VuFind 8.0.2

* Installation war [Aufgabe zur heutigen Sitzung](05_metadaten-modellieren-und-schnittstellen-nutzen.md#Aufgaben).

### Konfiguration Suche und Facetten

* Testweise konfigurieren war [Aufgabe zur heutigen Sitzung](05_metadaten-modellieren-und-schnittstellen-nutzen.md#Aufgaben).

## Funktion von Suchmaschinen am Beispiel von Solr

* Zur Einordnung von Solr
* Sichtung von Solr in VuFind

### Zur Einordnung von Solr

* Solr ist zusammen mit Elasticsearch quasi "Industriestandard".
* Üblicherweise sollte vor dem Import der Daten in einem Schema festgelegt werden welche Felder existieren und welche Datentypen diese beinhalten dürfen.
* Solr hat zwar eine integrierte Suchoberfläche, aber diese ist nur zu Demo-Zwecken gedacht.
* Das Discovery-System VuFind basiert auf Solr (ebenso wie viele kommerzielle Lösungen wie z.B. Ex Libris Primo).

### Suchindex (Solr) oder Datenbank (MySQL)?

| Solr                     | MySQL                   |
| ------------------------ | ----------------------- |
| flache Dokumente         | relationale Datensätze  |
| lexikalische Suche       | reiner Glyphenvergleich |
| keine Konsistenzprüfung  | Transaktionssicherheit  |
| statische Daten          | veränderliche Daten     |
| -> **Retrieval** (Suche) | -> **Storage** (CRUD)   |

* [CRUD](https://de.wikipedia.org/wiki/CRUD): **C**reate, **R**ead, **U**pdate, **D**elete

### Sichtung von Solr in VuFind

* Administrationsoberfläche: <http://localhost:8983>
* Bibliografische Daten im Index "biblio": <http://localhost:8983/solr/#/biblio>
* Technische Suchoberfläche in Solr für Index "biblio": <http://localhost:8983/solr/#/biblio/query>
* Schema des Index "biblio": <http://localhost:8983/solr/#/biblio/schema>
  * Erläuterung der VuFind-Felder in VuFind Doku: <https://vufind.org/wiki/development:architecture:solr_index_schema>

Note:
- Ggf. müssen Sie Solr neustarten, falls Sie zwischenzeitlich Ihre VM neu gebootet haben:

```shell
/usr/local/vufind/solr.sh start
```

### Übung: Suche in VuFind vs. Suche in Solr

* Suchen in VuFind: http://localhost/vufind
  * Beispielsweise nach `psychology`
* Suchen in Admin-Oberfläche von Solr: http://localhost:8983/solr/#/biblio/query
  * im Feld q mit Feldname:Suchbegriff. Beispiel: `allfields:psychology`
  * unten links Button "Execute Query"
* Parallel Logdatei von Solr anschauen in einem Terminal
    ```shell
    less +F /usr/local/vufind/solr/vufind/logs/solr.log
    ```
* Notieren Sie Unterschiede und Auffälligkeiten im gemeinsamen Dokument

Note:
- Das Programm `less` kann bei Bedarf im Terminal beendet werden mit der Tastenkombination `STRG` + `C` (für interrupt) und dann der Taste `q` (für quit).

### Literatur zu Solr

* Das offizielle Handbuch zu Solr beinhaltet ein gutes Tutorial (ca. 2 Stunden): <https://lucene.apache.org/solr/guide/8_7/solr-tutorial.html>

## Übung zur Datenintegration

Ziel: Import der mit MarcEdit und OpenRefine konvertierten Daten aus Koha, ArchivesSpace, DSpace und DOAJ in VuFind

### Testdaten löschen

Quelle: https://vufind.org/wiki/indexing:re-indexing

```shell
/usr/local/vufind/solr.sh stop
rm -rf /usr/local/vufind/solr/vufind/biblio/index /usr/local/vufind/solr/vufind/biblio/spell*
/usr/local/vufind/solr.sh start
```

### Aufgabe für die Gruppenarbeit

* Importieren Sie alle in MARCXML konvertierten Daten. Gehen Sie dabei wie folgt vor:
    1. Laden und entpacken Sie [die Beispieldaten](https://bain.felixlohmeier.de/data/vufind-testdaten.zip). Gerne können Sie zusätzlich Ihre selbst in MARCXML konvertierten Daten verwenden.
        * Wenn Sie nach Klick auf den Downloadlink das Programm "Archive Manager" auswählen, können Sie die enthaltenen Verzeichnisse und Dateien bequem über den Button "Extract" in ein beliebiges Verzeichnis speichern.
        * Wir gehen im Folgenden vom Verzeichnis `Downloads` aus.
    2. Bearbeiten Sie vor dem Import die Datei `marc_local.properties` um den Daten eine "collection" zuzuweisen.
        ```shell
        gedit /usr/local/vufind/import/marc_local.properties
        ```
    3. Starten Sie das Importscript für die erste Datenquelle. Beispiel für Koha:
        ```shell
        for f in ~/Downloads/koha/*.xml; do /usr/local/vufind/import-marc.sh $f; done
        ```
    4. Wiederholen Sie die Schritte 2 und 3 für die übrigen Datenquellen.
* Achtung: Der Import der Beispieldaten von ArchivesSpace und DSpace schlägt fehl. Finden Sie die Ursache.
* Fügen Sie am Ende der Übung einen Screenshot der Trefferliste einer "leeren" Suche in das gemeinsame Dokument ein.

Note:
- Die Beispieldaten umfassen die in den vergangenen Lehreinheiten mit MarcEdit und OpenRefine prozessierten Daten sowie den Export aus Koha. Wir stellen Sie hier bereit, damit Sie einheitliche Daten zur Verfügung haben auch wenn bei den vorherigen Aufgaben etwas durcheinandergekommen ist.

## Marktüberblick Discovery-Systeme

### International (kommerziell)

* Jährlicher Library Systems Report von Marshall Breeding im ALA Magazine: <https://americanlibrariesmagazine.org/2020/05/01/2020-library-systems-report/>
  * [Suche auf librarytechnology.org](https://librarytechnology.org/products/main.pl) vermittelt guten Überblick
  * siehe auch [Statistik der Verkaufszahlen](https://librarytechnology.org/products/sales/)
* Marktführer ist Ex Libris mit [Primo](https://exlibrisgroup.com/de/produkte/primo/inhalts-index/)
  * Alternative: OCLC mit [WorldCat Discovery](https://www.oclc.org/de/worldcat-discovery.html)
  * Alternative: EBSCO mit [EDS](https://www.ebsco.com/de-de/wissenschaftliche-bibliotheken/produkte/ebsco-discovery-service)
  * (Summon wird zugunsten von Primo abgekündigt)

Note:
- Den Library Systems Report hatten wir uns zuvor bereits angeschaut, damals jedoch mit Blick auf Bibliothekssysteme. Marshall Breeding führt in seinem Bericht aber auch Discovery-Systeme auf.
- Die Funktionalität eines Discovery-Systems besteht aus mindestens zwei Komponenten: Der Software und den Daten.
- Kommerzielle Discovery-Systeme verkaufen einen Suchindex meist separat, der vor allem Metadaten zu elektronischen Artikeln enthält.

### International (Open Source)

* Open Source-Alternative: [VuFind](https://vufind.org/vufind/) (ohne eigenen Artikelindex)
  * Nische: [typo3-find](https://github.com/subugoe/typo3-find)
* Alternative Zentralindizes: [K10plus-Zentral](https://verbundwiki.gbv.de/display/VZG/K10plus-Zentral), [finc Artikelindex](https://finc.info/services)

### Schweiz: SLSP

* Durch [Swiss Library Service Platform](https://slsp.ch) wurde Ex Libris Alma und damit auch das dazu gehörige Discovery-System Primo VE an den wissenschaftlichen Bibliotheken in der Schweiz eingeführt.
* Am Mo, 7.12.2020 ist das neue Rechercheportal [swisscovery](https://swisscovery.slsp.ch) gestartet.
* Ergänzend zu SLSP wird vom Verein swisscollections der Sucheinstieg [swisscollections](https://swisscollections.ch) für Sammlungen angeboten. Dieses Portal wurde mit VuFind und Eigenentwicklungen der UB Basel realisiert.

## Zwischenfazit

![Schaubild zu Lehrinhalten](images/schaubild-lehrinhalte.png)

# Aufgaben

Bis zum nächsten Termin:

1. Beitrag im Lerntagebuch zu dieser Lehreinheit (3000 - 4000 Zeichen)
2. Lehrevaluation
