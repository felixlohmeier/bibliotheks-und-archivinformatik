# Metadaten transformieren mit OpenRefine und MarcEdit

Auszug aus den Lernzielen:

* Bibliothekarische und archivarische Metadaten (z.B. MARC, MARCXML, MODS, Dublin Core, EAD, BIBFRAME) zu modellieren und diese mit entsprechenden Protokollen / Anwendungen zu übertragen
* Crosswalks zwischen unterschiedlichen Metadatenformaten zu programmieren

## Nachträge zu Punkten aus den Lerntagebüchern

* Nach dem Start von ArchivesSpace gab es weitere Meldungen im Terminal. Wir sollten noch einmal klären, was das bedeutet. Bei OpenRefine ist es nämlich ähnlich.
  * Es handelt sich um Webanwendungen. Im Terminal läuft die Server-Applikation. Über den Browser greifen wir darauf zu. Wenn das Terminal geschlossen wird, dann wird auch der Server beendet und die Webseite im Browser ist nicht mehr erreichbar.
* Spracheinstellung von ArchivesSpace: Es gibt noch keine deutsche Übersetzung aber Spanisch, Französisch und Japanisch
  * Konfiguration: https://archivesspace.github.io/archivesspace/user/configuring-archivesspace/#Language
  * Sprachdateien: https://github.com/archivesspace/archivesspace/tree/master/common/locales
* Warum hat der Import der Beispielkollektion so lange gedauert?
  * Vermutlich, weil wir nur die mitgelieferte Datenbank (für Testzwecke) verwendet haben und keine separate MySQL-Datenbank
  * Außerdem ist EAD ein komplexes Dateiformat, was etwas aufwendiger auszuwerten ist (daher auch die mehreren "Cycles" in der Log-Datei)
  * Dokumentation zu "Tuning": http://archivesspace.github.io/archivesspace/user/tuning-archivesspace/
* Wie kann ich ein Objekt in ArchivesSpace von Grund auf anlegen?
  * Video von ArchivesSpace: https://www.youtube.com/watch?v=WrZB0Fj2pIU&list=PL3cxupmXL7WiXaHnpVquPrUUiLiDAMhg0&index=4&t=0s 
  * Workflow Overview bei Orbis Cascade Alliance: https://www.orbiscascade.org/achivesspace-workflow-overview/
  * Walkthrough Criss Library, University of Nebraska at Omaha: https://www2.archivists.org/sites/all/files/UNO_ArchivesSpace_Walkthroughs_2015.pdf
  * ArchivesSpace Manual for Local Usage at NYU: https://docs.google.com/document/d/11kWxbFTazB6q5fDNBWDHJxMf3wdVsp8cd7HzjEhE-ao/edit#
* Wie wird der virtuelle Lesesaal in Archiven funktionieren?
  * Meldung zur Veröffentlichung des Konzepts des VSA von 2016: https://archive20.hypotheses.org/3348
  * Technische Zugriffsbeschränkungen spielen dort gar keine große Rolle, vgl. Kapitel 4.4 Aufbereitung und Auslieferung auf S. 44: http://vsa-aas.ch/wp-content/uploads/2016/04/Konzept_und_Anforderungskatalog_Virtueller_Lesesaal.pdf

## Transformation von Metadaten mit OpenRefine

* Notebook mit Installationsanleitung: https://nbviewer.jupyter.org/github/felixlohmeier/bibliotheks-und-archivinformatik/blob/master/04-lc-openrefine.ipynb

* Als Hausaufgabe haben die Studierenden die [Library Carpentry Lesson zu OpenRefine](https://librarycarpentry.github.io/lc-open-refine/) bearbeitet. Fragen dazu:

  * Automatischer Start im Browser funktioniert nicht unter Lubuntu? Im Browser Adresse http://127.0.0.1:3333 oder http://localhost:3333 aufrufen
  * Arbeitsspeicher: VirtualBox Einstellung prüfen, OpenRefine verwendet standardmäßig bis zu 1400M (1,4 GB)
  * OpenRefine beenden: `STRG`+`C` im Terminal

* Für welche Zwecke und Formate eignet sich OpenRefine?
  * Besonders geeignet für tabellarische Daten (CSV, TSV, XLS, XLSX und auch TXT mit Trennzeichen oder festen Spaltenbreiten)
  * Einfaches "flaches" XML (z.B. MARCXML) oder JSON ist mit etwas Übung noch relativ einfach zu modellieren
  * Komplexes XML mit Hierarchien (z.B. EAD) ist möglich, aber nur mit Zusatztools, siehe beispielsweise:
    * Lightning Talk auf einem Workshop zu OpenRefine und EAD: https://felixlohmeier.de/slides/2017-05-05_dini-ag-kim_ead-lightning-talk.html
    * Adventures in metadata hygiene: using Open Refine, XSLT, and Excel to dedup and reconcile name and subject headings in EAD https://blogs.library.duke.edu/bitstreams/2015/05/01/metadata-adventures/
    * Video zu einem komplexen Anwendungsfall: https://www.orbiscascade.org/using-openrefine-for-cleanup/

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

* Import von XML mit OpenRefine
  * MARC21: Beispieldaten unter http://www.loc.gov/standards/marcxml/ ("MARCXML Example Documents")
    * MARCXML Collection (mehrere Dokumente): http://www.loc.gov/standards/marcxml/xml/collection.xml
    * Dublin Core (aus MARC21 transformiert, ein Dokument): http://www.loc.gov/standards/marcxml/Sandburg/sandburgdc.xml
    * MODS (aus MARC21 transformiert, ein Dokument): http://www.loc.gov/standards/marcxml/Sandburg/sandburgmods.xml
  * EAD: Prudence Wayland Smith Papers (hatten wir in ArchivesSpace importiert): http://eadiva.com/sampleEAD/syr-wayland-smith_p.xml
  * Import von JSON funktioniert ähnlich

* OpenRefine ist auch für Windows und Mac verfügbar!

## XSLT Crosswalks mit MarcEdit

* MarcEdit installieren
  * Offizielle Webseite: https://marcedit.reeset.net
  * Notebook mit Installationsanleitung: https://nbviewer.jupyter.org/github/felixlohmeier/bibliotheks-und-archivinformatik/blob/master/04-marcedit.ipynb
* Übungen zu MarcEdit bei Library Carpentry (work in progress): https://librarycarpentry.org/lc-marcedit/01-introduction/index.html
* MarcEdit ist auch für Windows und Mac verfügbar!

* Anwendungsfälle
  * EAD zu MARC21
  * DC zu MARC21
  * MARC21 zu DSpaceDC
  * MARC21 zu MODS

* Anleitung für XML Conversion mit MarcEdit von der Unibibliothek aus Illinois: https://guides.library.illinois.edu/c.php?g=463460&p=3168159
  * Von MarcEdit verwendete XSLT Dateien liegen auch hier: https://github.com/reeset/marcedit_xslt_files und https://github.com/reeset/marcedit-xslts
  * Achtung: Die Voreinstellungen in der Linux-Version von MarcEdit sind fehlerhaft. Sie können wie folgt korrigiert werden:
    * MarcTools
    * Button Tools / Edit XML Function List
    * Für alle benötigten Funktionen:
      * Im Menü "Defined Functions" die gewünschte Funktion auswählen und Modify klicken
      * Unter XSLT/XQuery Path `XSLT\` durch `xslt/`
  * Wir testen mit unseren Beispieldaten:
    * http://eadiva.com/ead-sample-prudence-wayland-smith-papers/
    * http://www.loc.gov/standards/marcxml/
* Literaturempfehlung für Einstieg in XSLT: https://programminghistorian.org/en/lessons/transforming-xml-with-xsl

## Schnittstellen SRU, OAI-PMH und Z39.50 harvesten

Es gibt zahlreiche Übertragungsprotokolle im Bibliotheks- und Archivbereich. Drei davon sind besonders weit verbreitet:

* Z39.50 (Library of Congress)
* SRU - Search/Retrieve via URL (Library of Congress)
* OAI-PMH - Open Archives Initiative Protocol for Metadata Harvesting (Open Archives Initiative)

Z39.50 ist sehr alt, aber immer noch im Einsatz. Meist wird das modernere SRU als Ergänzung angeboten.

Während Z39.50 und SRU sich besonders für Live-Abfragen oder gezielten Datenabruf mit vielen Parametern eignet, zielt OAI-PMH vor allem auf größere Datenabzüge und regelmäßige Aktualisierungen. Das Schöne an SRU und OAI-PMH ist, dass die Anfragen als Internetadresse (URL) zusammengestellt werden können und direkt über den Browser ohne Zusatzsoftware aufrufbar sind.

### SRU und OAI am Beispiel von Swissbib

Das Projekt swissbib sammelt Metadaten aller schweizer Universitätsbibliotheken, der Nationalbibliothek und einiger Kantonsbibliotheken sowie weiterer Institutionen. Der gemeinsame Katalog ermöglicht eine übergreifende Suche, gleichzeitig bietet swissbib auch Schnittstellen an, über welche Metadaten der teilnehmenden Institutionen zentral bezogen werden können.

* Dokumentation Swissbib SRU: http://www.swissbib.org/wiki/index.php?title=SRU
* Dokumentation Swissbib OAI: http://www.swissbib.org/wiki/index.php?title=Swissbib_oai

**Aufgabe 0**

Lesen Sie die [Dokumentation zur SRU-Schnittstelle von Swissbib](http://www.swissbib.org/wiki/index.php?title=SRU) und stellen Sie eine Abfrage mit folgenden Parametern zusammen:

* Katalog der Bibliothek der FH Graubünden
* Suche über alle Felder nach Suchbegriff: open
* Format:MARC XML - swissbib

Sie können dazu das Formular auf der Webseite http://sru.swissbib.ch verwenden oder die URL anhand der Dokumentation selbst zusammenbauen.

**Aufgabe 1**

Laden Sie die gleichen Daten in anderen Formaten (z.B. Dublin Core) und vergleichen Sie

Tipp: Öffnen Sie zwei Browserfenster nebeneinander, um die Unterschiede leichter sehen zu können.

Was ist Ihnen aufgefallen (kleine Wiederholung)?
* MARC21 umfangreich, Dublin Core eher kompakt

Swissbib nutzt XSL Stylesheets, um live bei einer Suchanfrage, die Daten in verschiedene Metadatenformate zu konvertieren.

**Aufgabe 2**

Laden Sie 100 Datensätze der ETH-Bibliothek (Hauptbibliothek Rämistrasse 101, 8092 Zürich) für den Suchbegriff Albert Einstein (über alle Felder) im Format MARC21. Speichern Sie die Daten in der Datei `einstein.xml`.

Lösung:

* dc.possessingInstitution = E01
* dc.anywhere = Albert Einstein

URL:
```
http://sru.swissbib.ch/sru/search/defaultdb?
query=+dc.possessingInstitution+%3D+E01+AND+dc.anywhere+%3D+Albert+Einstein
&operation=searchRetrieve
&recordSchema=info%3Asrw%2Fschema%2F1%2Fmarcxml-v1.1-light
&maximumRecords=100
&startRecord=0
&recordPacking=XML
&availableDBs=defaultdb
&sortKeys=Submit+query
```

Alternativ mit curl:
```
curl "http://sru.swissbib.ch/sru/search/defaultdb?query=+dc.possessingInstitution+%3D+E01+AND+dc.anywhere+%3D+Albert+Einstein&operation=searchRetrieve&recordSchema=info%3Asrw%2Fschema%2F1%2Fmarcxml-v1.1-light&maximumRecords=100&startRecord=100&recordPacking=XML&availableDBs=defaultdb&sortKeys=Submit+query" > einstein.xml
```

**Aufgabe 3**

Lesen Sie die [Dokumentation zur OAI-Schnittstelle von Swissbib](http://www.swissbib.org/wiki/index.php?title=Swissbib_oai).

Laden Sie einige Datensätze aus dem gesamten Swissbib-Verbund, die seit dem 11.11.2019 verändert wurden im Format MARC21. Speichern Sie die Daten in der Datei `swissbib-2019-11-01.xml`.

Lösung:

http://oai.swissbib.ch/oai/DB=2.1/?verb=ListRecords&metadataPrefix=m21-xml%2Foai&from=2019-11-11

**Bonusaufgabe**

Finden Sie heraus, nach welchen Regeln die SRU-Schnittstelle von Swissbib MARC21 in Dublin Core transformiert.

Lösung:
* Explain-Befehl der SRU-Schnittstelle: http://sru.swissbib.ch/sru/explain?operation=explain
* Dort Informationen zum Schema unter `ns:schemaInfo`
* Link zum XSL Stylesheet: http://sru.swissbib.ch/sru/xslfiles/MARC21slim2OAIDC.swissbib.xsl

## Weitere Tools für Metadatentransformationen

**Zur Motivation:**

Metadaten-Management in der Praxis, hier beim Leibniz-Informationszentrum Wirtschaft (ZBW) in Hamburg:
* Infoseite: https://www.zbw.eu/de/ueber-uns/arbeitsschwerpunkte/metadaten/
* Videointerview mit Kirsten Jeude: https://www.youtube.com/watch?v=YwbRTDvt_sA

**Tools:**

Prof. Magnus Pfeffer (2016): Open Source Software zur Verarbeitung und Analyse von Metadaten. Präsentation auf dem 6. Bibliothekskongress. <http://nbn-resolving.de/urn/resolver.pl?urn:nbn:de:0290-opus4-24490>

* Catmandu (Perl): https://librecat.org
* Metafacture (Java): https://github.com/metafacture/metafacture-core
* OAI harvester für die Kommandozeile: https://github.com/miku/metha
* siehe auch die vielen Tools zu MARC21: https://wiki.code4lib.org/Working_with_MARC