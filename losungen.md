# Lösungen

## [3.2 Übertragungsprotokolle SRU und OAI-PMH](/kapitel-3/32-ubertragungsprotokolle-sru-und-oai-pmh.md)

### Aufgabe 1

```
curl "http://sru.swissbib.ch/sru/search/defaultdb?query=+dc.possessingInstitution+%3D+E01+AND+dc.anywhere+%3D+Albert+Einstein&operation=searchRetrieve&recordSchema=info%3Asrw%2Fschema%2F1%2Fmarcxml-v1.1-light&maximumRecords=100" > einstein.xml
```

### Aufgabe 2

```
curl "http://oai.swissbib.ch/oai/DB=2.1?verb=ListRecords&metadataPrefix=m21-xml%2Foai&set=A&from=2017-10-31" > swissbib-2017-10-31.xml
```

### Bonusaufgabe

* Rufen Sie den [Explain-Befehl der SRU-Schnittstelle von Swissbib](http://sru.swissbib.ch/sru/explain?operation=explain) auf. Im XML gibt es ein Element `ns:schemaInfo` in dem  Informationen zu den angebotenen Metadatenformaten stehen. Bei Dublin Core ist im Attribut `location` ein [XSL-Stylesheet](http://sru.swissbib.ch/sru/xslfiles/MARC21slim2OAIDC.swissbib.xsl) verlinkt. Diesem sind konkrete Transformationsanweisungen zu entnehmen, siehe Interpretation in [Kapitel 3.6.](/kapitel-3/36-bonus-vergleich-mit-crosswalk-ergebnissen.md)

## [3.5 Verarbeitung von MARC21 mit OpenRefine](/kapitel-3/35-verarbeitung-von-marc21-mit-openrefine.md)

### Aufgabe 2

JSON-Datei mit Transformationsregeln für ein Mapping von MARC21 auf Dublin Core: [openrefine-marc2dc.json](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/openrefine/openrefine-marc2dc.json)

Ergebnis als TSV-Datei: [openrefine/einstein-nebis\_2017-11-02.tsv](https://github.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/raw/master/openrefine/einstein-nebis_2017-11-02.tsv)

Folgende Mappings wurden darin exemplarisch umgesetzt:

* contributor: 700/710/711 jeweils a,D,d,e
* coverage: 651 a
* creator: 100 a,D,d,e
* date: 008 Zeichen 7-10
* description: 500-599 ohne 506, 530, 540, 546
* extent: 300a
* format: LDR Zeichen 6 \(codes aufgelöst nach [MARC Spezifikation](https://www.loc.gov/marc/bibliographic/bdleader.html)\)
* identifier: 020/022/024 jeweils a
* language: 008 Zeichen 35-37
* pages: Zahlen aus extent mit RegEx extrahiert \(kein Dublin Core, individuelles Zusatzfeld\)
* publisher: 260 a,b
* title: 245 a,b
* type: 655a \(nachbearbeitet mit uniques-Funktion\)

## [3.6 Bonus: Vergleich mit Crosswalk-Ergebnissen](/kapitel-3/36-bonus-vergleich-mit-crosswalk-ergebnissen.md)

Folgende Regeln stehen \(leicht vereinfacht\) darin:

* dc:id aus MARC 001
* dc:creator aus MARC 100, 110, 111, 700, 710, 711, 720
* dc:title aus MARC 245 a,b,f,g,h,k
* dc:type aus MARC 655 und aus leader
* dc:publisher aus MARC 260a und 260b
* dc:date aus MARC 260c
* dc:language aus MARC controlfield 008
* dc:format aus MARC 856q
* dc:description aus MARC 500a bis 599a \(ohne 506, 530, 540 und 546\)
* dc:subject aus MARC 600, 610, 611, 630, 650, 653, jeweils a,b,c,d,q
* dc:coverage aus MARC 752a, 752b, 752c, 752d
* dc:relation aus MARC 530a, 530b, 530c, 530d, 530u und aus 760, 762, 765, 767, 770, 772-777, 780, 785-787  jeweils o und t
* dc:identifier aus MARC 856u und 020a
* dc:rights aus MARC 506a, 540a



