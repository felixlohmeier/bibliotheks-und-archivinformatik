# 7.9 Publikation und Nachnutzung

## Linked Open Data

* Im Projekt: Open Data Call
* Ca. 80% unter CC0 lizenziert
* Kennzeichnung der nicht-CC0 Daten in den Verbünden
* Ausschluss dieser Daten für die Schnittstelle data.swissbib.ch

## Schnittstellen für Maschinen

<http://data.swissbib.ch>

* auf REST und Hydra Prinzipien basierend
* SPARQL hat oft eine geringe Verfügbarkeit, deshalb bisher nicht eingesetzt

Beispiel für SPARQL-Abfrage: [Suche nach allen Autoren in DBPedia mit ihren bemerkenswerten Werken und dem Publikationsdatum der Werke](http://dbpedia.org/sparql?default-graph-uri=http%3A%2F%2Fdbpedia.org&qtxt=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+dbo%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0D%0APREFIX+dbp%3A+%3Chttp%3A%2F%2Fdbpedia.org%2Fproperty%2F%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0A%0D%0ASELECT+%3Fauthor+%3Fwork+%3Fdate+%0D%0AFROM+%3Chttp%3A%2F%2Fdbpedia.org%2F%3E+%0D%0AWHERE+%7B%0D%0A+++++++%3Fauthor+rdf%3Atype+dbo%3AWriter+.%0D%0A+++++++%3Fauthor+dbo%3AnotableWork+%3Fwork+.%0D%0A+++++++%3Fwork+dbp%3AreleaseDate+%3Fdate+%0D%0A%7D+ORDER+BY+DESC%28%3Fdate%29%0D%0ALIMIT+100%0D%0A&format=text%2Fhtml&CXML_redir_for_subjs=121&CXML_redir_for_hrefs=&timeout=30000&debug=on) (Quelle: [Kurs Semantic Web 2016 auf OpenHPI](https://open.hpi.de/courses/semanticweb2016))

## Übung: Lokale SPARQL-Abfrage

Starten Sie das vorbereitete Shellscript in der Arbeitsumgebung

```
~/htwChur.linked.swissbib/machwas/linking/lokale.sparql.abfrage.sh
```

## Wie weiter?

* Daten verbessern: Personen, Werk
* Nutzung ermöglichen
* Oberfläche ausbauen

## Quellen und Links

* GitHub: <https://github.com/swissbib> und <https://github.com/linked-swissbib>
* linked.swissbib.ch: Prototype User Interface <http://linked.swissbib.ch>
* linked.swissbib.ch: Beta RESTful API <http://data.swissbib.ch>
* Blog series "swissbib data goes linked" <http://swissbib.blogspot.ch/2016/04/swissbib-data-goes-linked-teil-1.html>
* Interlinking Large Scale Library Data with Authority Records / Felix Bensmann, Benjamin Zapilko and Philipp Mayr <http://journal.frontiersin.org/article/10.3389/fdigh.2017.00005/full>
* Datenmodell linked.swissbib <https://linked-swissbib.github.io/datamodel/>
* Elasticsearch as Hub for Linked Bibliographic Metadata <http://files.meetup.com/7646592/20160831%20Elasticsearch%20as%20Hub%20for%20Linked%20Bibliographic%20Metadata.pdf> und <https://www.elastic.co/videos/elasticsearch-as-hub-for-linked-bibliographic-metadata-zurich-meetup-august-2016>
* Suominen, Osma, & Nina Hyvönen. "From MARC silos to Linked Data silos?.". In: o-bib 4.2 (2017): 1-13. <https://www.o-bib.de/article/view/2017H2S1-13/5854>
* Beschreibung des Metamorph – Datenmodells: <http://b3e.net/metamorph-book/latest/datamodel.html>

## Kontakt

* [Günter Hipler](mailto:guenter.hipler@unibas.ch), Systems Architect, Project swissbib, Universitätbibliothek Basel
* [Silvia Witzig](mailto:silvia.witzig@unibas.ch), Metadata Specialist, Project swissbib, Universitätbibliothek Basel
