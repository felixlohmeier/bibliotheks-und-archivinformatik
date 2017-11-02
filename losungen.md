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



