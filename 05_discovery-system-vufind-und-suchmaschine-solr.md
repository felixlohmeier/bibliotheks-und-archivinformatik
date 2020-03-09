# Discovery-System VuFind und Suchmaschine Solr

## Nachträge zu Themen aus den Lerntagebüchern

Zu Tag 4 (06.11., OpenRefine, MarcEdit, SRU, OAI, ...):
* Unterscheidung von Programmen (z.B. MarcEdit, OpenRefine) und Standards (z.B. XSLT, SRU) ist wichtig:
  * Ein Standard wird von einem Gremium spezifiziert oder entwickelt sich mit der Zeit durch die hohe Verbreitung zu einem Industriestandard (auch De-facto Standard genannt, Beispiel: SQL).
  * Entwickler*innen von Programmen implementieren dann diese Standards (im Idealfall vollständig, manchmal aber auch nur teilweise).
  * Auf welchen Wegen können Sie a) XSLT-Crosswalks schreiben und b) anwenden?
  * Mit welchen Anwendungen können Sie eine SRU-Schnittstelle abfragen?
* Ein Lerntagebuch hat den Wikipedia-Eintrag zu SRU diskutiert: https://de.wikipedia.org/wiki/Search/Retrieve_via_URL. Im Prinzip ein Pluspunkt für das Bewertungskriterium "Kontextualisierung", aber achten Sie dabei auf die Details. Hinterfragen Sie die Angaben oder prüfen Sie ggf. noch eine zweite Quelle, bevor etwas übernehmen:
  * Welches Protokoll beinhaltet SOAP: SRU oder SRW?
  * Wer hat den Standard entwickelt? Vgl. Artikel im Fachmagazin D-LIB von 2009: http://www.dlib.org/dlib/january09/denenberg/01denenberg.html
  * Übrigens, das hatte ich nicht erklärt: Die Spezifikation des SRU-Standards beinhaltet auch eine Abfragesprache CQL (Contextual Query Language), die auch anderswo verwendet wird (z.B. beim Kalliope Verbundkatalog: http://kalliope.staatsbibliothek-berlin.de/de/support/cql.html)
* Was ist der Unterschied zwischen kostenfreier Software wie MarcEdit und Open-Source-Software?
  * Offizielle Definition: https://opensource.org/osd
  * Für Daten und Inhalte: https://opendefinition.org

## Gastvortrag von Noémie Ammann (ETH-Bibliothek) zu Primo und SLSP

LinkedIn Profil: <https://www.linkedin.com/in/noémie-ammann-4aa18418b/>
* seit über 5 Jahren IT-Spezialistin an der ETH-Bibliothek
* Diploma of Advanced Studies in Bibliotheks- und Informationswissenschaft (2013) und Master in Germanistik (2008)
* Dozentin an der Uni Zürich im MAS Bibliotheks- und Informationswissenschaft
* zertifiziert für Alma und Primo

ETH wird im Rahmen von SLSP nicht nur von Aleph zu Alma, sondern auch von Primo zu Primo VE migrieren. Primo VE ist eine in Alma integrierte Discovery Lösung, für welche zwar das gleiche User Interface eingesetzt wird, die aber im Hintergrund ganz anders konzipiert ist.

### Präsentation

Präsentationsfolien in Moodle: https://moodle.fhgr.ch/mod/resource/view.php?id=247387 (zugriffsbeschränkt)

### Ergänzungen zur Präsentation

Primo-PNX anzeigen (funktioniert bei allen Primos): Am Ende der Internetadresse (URL) Folgendes anfügen:
```
&showPnx=true
```

Normalisierung und Anreicherung wird zukünftig in Alma umgesetzt (nicht mehr in Primo) - hier gibt es Überschneidungen zwischen den Produkten, weil Primo (ohne VE) auch mit anderen Bibliothekssystemen eingesetzt werden kann

Videotrainings in Dokumentation zu [Alma im Ex Libris Knowledge Center](https://knowledge.exlibrisgroup.com/Alma/Training/Getting_to_Know_Alma)

## Marktüberblick Discovery-Systeme

Jährlicher Library Systems Report von Marshall Breeding im ALA Magazine: https://americanlibrariesmagazine.org/2019/05/01/library-systems-report-2019/

## Funktionen von Suchmaschinen am Beispiel von Solr

Die Studierenden hatten die Aufgabe das offizielle Solr Tutorial zu bearbeiten: https://lucene.apache.org/solr/guide/8_2/solr-tutorial.html

Im Tutorial wird das Programm curl verwendet, dass bei uns noch nicht installiert ist. Mit folgendem Befehl kann es installiert werden:
```
sudo apt install curl
```

Aus der Diskussion:

* Datenimport: Solr kann verschiedene Dateiformate (.doc, .xml .json, .ppt usw.) importieren
* Schema: Üblicherweise sollte vor Import der Daten in einem Schema festgelegt werden welche Felder existieren und welche Datentypen diese beinhalten dürfen
* Solr hat zwar eine integrierte Suchoberfläche, aber die ist nur zu Demo-Zwecken gedacht
* Primo und VuFind basieren beide auf Solr

## VuFind

Zur Einführung:

* VuFind Internetseite: https://vufind.org
* VuFind Code bei GitHub: https://github.com/vufind-org/vufind
* Deutsche VuFind Anwendergemeinschaft: https://vufind.de
* Präsentation “10 Jahre VuFind” (2017): https://felixlohmeier.de/slides/2017-09-28_vufind-anwendertreffen-keynote.html

VuFind-Installationen weltweit: https://vufind.org/wiki/community:installations

- Beispiel TU Hamburg: https://katalog.tub.tuhh.de
- Beispiel Beluga Hamburg: https://katalog.tub.tuhh.de
- Beispiel UB Leipzig: https://katalog.ub.uni-leipzig.de

### Tutorial

Wir bearbeiten die Kapitel 3-9 von folgendem Tutorial:
https://felixlohmeier.gitbooks.io/vufind-tutorial-de/content/03_Installation_VuFind.html

Das Tutorial wurde ursprünglich von Stefan Niesner im Rahmen einer [Projektarbeit](http://malisprojekte.web.th-koeln.de/wordpress/stefan-niesner/) entwickelt und von mir für VuFind 4.1 aktualisiert.

**Achtung:** VuFind 4.1 läuft nicht unter Lubuntu 18.04 (im Tutorial ist vorgesehen VuFind unter 16.04 zu installieren). Unter 18.04 wird automatisch eine neuere Java-Version (11) installiert, VuFind benötigt aber eine ältere Version (8). Es gibt auch noch weitere Probleme. Wir installieren daher VuFind 6.0.1 abweichend vom Tutorial nach der offiziellen Installationsanleitung.

* VirtualBox Snapshot wiederherstellen
* Gemeinsame Installation nach Anleitung für Ubuntu: https://vufind.org/wiki/installation:ubuntu
* Nach dem Start des Solr Index geht es hier weiter: https://felixlohmeier.gitbooks.io/vufind-tutorial-de/content/03_Installation_VuFind.html

## Gruppenarbeit zu Metadatenflüssen

Konzeption Metadatenflüsse für Gruppenarbeit
  * Gemeinsam mit Tool Mermaid https://mermaidjs.github.io/mermaid-live-editor/
  * Diagramm: https://mermaidjs.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggVERcbmRvYWotYXJ0aWNsZS1zYW1wbGUuY3N2IC0tPiBPcGVuUmVmaW5lXG5Td2lzc2JpYi1PQUkgLS0-IE1hcmNFZGl0XG5PcGVuUmVmaW5lIC0tIE1BUkMyMS1YTUwgLS0-IFZ1RmluZFxuTWFyY0VkaXQgLS0gTUFSQzIxIC0tPiBWdUZpbmQiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9fQ

* Gruppenarbeit
  1. Gruppe "VuFind": Abwarten, bis die anderen beiden Gruppen Daten anliefern. Dann Daten importieren wie in Kapitel 4 (.mrc) und 12 (.xml) beschrieben. Zwischenzeitlich können Sie mit Testdaten experimentieren oder die Konfiguration von VuFind fortsetzen.

     * https://felixlohmeier.gitbooks.io/vufind-tutorial-de/content/04_Installation_Testimport.html
  2. Gruppe "OpenRefine": Aus Beispieldaten (DOAJ wie in der OpenRefine Übung) mit Templating MARC21-XML generieren und an Gruppe VuFind übergeben.
     * OpenRefine Server: http://167.172.188.147
     * Daten: https://raw.githubusercontent.com/LibraryCarpentry/lc-open-refine/gh-pages/data/doaj-article-sample.csv
     * Export von XML mit OpenRefine Templating
          * Vorlage: http://www.loc.gov/standards/marcxml/xml/collection.xml
          * Menü Export / Templating (oben rechts)
          * Prefix: `<collection xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">`
          * Row Template:
          ```
          <record>
            <leader></leader>
            <controlfield tag="001"></controlfield>
            <datafield tag="020" ind1=" " ind2=" ">
                <subfield code="a">{{cells["ISSNs"].value.escape("xml")}}</subfield>
            </datafield>
            <datafield tag="100" ind1=" " ind2=" ">
                <subfield code="a"></subfield>
            </datafield>
            <datafield tag="245" ind1=" " ind2=" ">
                <subfield code="a">{{cells["Title"].value.escape("xml")}}</subfield>
            </datafield>
          </record>
          ```
          * Row Separator: (Zeilenumbruch)
          * Suffix: `</collection>`
          * Link zum erarbeiteten Template: https://send.firefox.com/download/92464306f4503345/#eyJl9oLYo9vMY034ZDY2OA 
  3. Gruppe "MarcEdit": Mit MarcEdit Swissbib OAI abrufen, in MARC21 (.mrc) konvertieren und an Gruppe VuFind übergeben
     * MarcEdit Anleitung: https://guides.library.illinois.edu/c.php?g=463460&p=3168068
     * Swissbib OAI Dokumentation: http://www.swissbib.org/wiki/index.php?title=Swissbib_oai 
     * **Achtung:** Das Harvesting der OAI-Schnittstelle von Swissbib hatte nur teilweise funktioniert, weil MarcEdit und die Swissbib OAI-Schnittstelle nicht richtig harmonieren. Die anschließend mit MarcEdit exportierte MARC-Datei (.mrc) war daher unvollständig und konnte deshalb auch nicht in MarcEdit importiert werden. Zumindest für SRU ist es ein bekanntes Problem, vgl. Ticket bei GitHub https://github.com/swissbib/sruServer/issues/28.

Einfache Möglichkeit für Datentransfer: https://send.firefox.com

## Exkurs: Architektur der Suchmaschine DuckDuckGo

- DuckDuckGo verwendet vorrangig Programmierschnittstellen (APIs) von anderen, größeren Suchmaschinen (Yahoo, Bing, Yandex, Wolfram Alpha) aber auch zahlreiche weitere Quellen und auch eigene Webcrawler. Nach eigener Angabe sollen es über 400 verschiedene Quellen sein.
- Genaue Informationen zur aktuellen Systemarchitektur sind nicht zu finden. Nur ein Teil des Codes ist Open Source. Aus einem Artikel von 2013 ist zu entnehmen, dass damals Solr und PostgreSQL für die Datenhaltung eingesetzt wurden. Es wird so dargestellt, dass manche Quellen in Solr und manche in PostgreSQL und weitere in anderer Form abgelegt werden.
- Bei der eigenen Datenhaltung handelt es sich ohnehin offenbar nur um einen Cache, um Suchanfragen zu beschleunigen. Der Cache wird vermutlich spätestens nach 24 Stunden erneuert, um aktuelle Suchtreffer anbieten zu können.
- Google wird offenbar überhaupt nicht als Datenquelle genutzt. Das Layout und die Funktionen sehen zwar ähnlich aus, aber es ist offenbar alles "nachgebaut".

Quellen:

- Offizielle Hilfeseite von DuckDuckGo zum Thema "Sources": https://help.duckduckgo.com/duckduckgo-help-pages/results/sources/
- Artikel von 2013 auf Basis eines Interview mit dem Geschäftsführer von DuckDuckGo, Gabriel Weinberg: http://highscalability.com/blog/2013/1/28/duckduckgo-architecture-1-million-deep-searches-a-day-and-gr.html
- Englische Wikipedia: https://en.wikipedia.org/wiki/DuckDuckGo
- Deutsche Wikipedia: https://de.wikipedia.org/wiki/DuckDuckGo