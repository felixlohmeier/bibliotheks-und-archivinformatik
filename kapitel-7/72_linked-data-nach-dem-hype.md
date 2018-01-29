# 7.2 Linked Data nach dem Hype

## Präsentation von Kai Eckert (2015)

[![](/images/eckert-2015.png)](https://www.slideshare.net/kaiec/linked-data-nach-dem-hype)

Quelle: <https://www.slideshare.net/kaiec/linked-data-nach-dem-hype>

## Potentiale von Linked Data für Bibliotheken

Im Seminar haben wir versucht die praktischen Potentiale von Linked Data am Flipchart zu sammeln. Herausgekommen sind folgende Punkte:

* Katalogisierungsprinzip (z.B. in [BIBFRAME](https://www.loc.gov/bibframe/))
* übergreifende Suche
* Verwandtes/Zusammengehöriges entdecken
* Statistische Analysen
* Einheitlichkeit und Effizienz

Ermöglicht werden diese Potentiale durch die Verknüpfung von bisher unverbundenen Datensilos mit Bezug auf gemeinsame Identifier.

* Grundlegendes Datenmodell ist das [Resource Description Framework (RDF)](https://www.w3.org/RDF/) in verschiedenen Serialisierungsformen (Turtle, N-Triples, N-Quads und aktuell besonders [JSON-LD](https://json-ld.org/)).
* Ein Austausch wird ermöglicht durch die Nutzung standardisierter Vokabulare wie [dcterms](http://lov.okfn.org/dataset/lov/vocabs/dcterms), [schema](http://lov.okfn.org/dataset/lov/vocabs/schema), [foaf](http://lov.okfn.org/dataset/lov/vocabs/foaf), [bibo](http://lov.okfn.org/dataset/lov/vocabs/bibo) und so weiter.
* Die Daten werden in sogenannten Triple-Stores abgelegt und sind über die Abfragesprache SPARQL abrufbar. Was mit SPARQL möglich ist, zeigt eindrücklich der [Wikidata Query Service](https://query.wikidata.org).

## Literatur

* [Einführungsartikel zu Resource Description Framework (RDF)](http://linkeddata.fh-htwchur.ch/Grundlagen-StrukturierteBeschreibung.html)
* [Einführungsartikel zur Abfragesprache SPARQL](http://linkeddata.fh-htwchur.ch/Grundlagen-SPARQL.html)
