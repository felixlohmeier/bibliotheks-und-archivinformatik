# 7.4 Datenmodell und Datentransformation

## Datenmodell 

Das Datenmodell von linked.swissbib wurde anhand der Frage "Was wollen wir auf der Oberfläche anbieten?" nutzergesteuert entwickelt:

* Aggregationsseiten (eigener und angereicherter Inhalt)
* Knowledge Cards (Inspiration: Google Knowledge Graph), jeweils zu Autoren, Werken und Themen
* Erweitertes Autocomplete

Die MARC-Datensätze wurden dazu in 6 bibliographische Konzepte aufgeteilt:

1. Bibliographic Resource
2. Document
3. Item
4. Work
5. Person
6. Organisation

Siehe auch: Dokumentation des Datenmodells unter <https://linked-swissbib.github.io/datamodel/>

## Vokabularien

Es wurde der Ansatz verfolgt, möglichst bekannte, viel genutzte Vokabulare zu verwenden. Letztlich wurden folgende Vokabulare nachgenutzt:

* Dublin Core (dc/dct)
* Bibliographic Ontology (bibo)
* Bibframe (bf)
* RDA – unconstrained properties (rdau)
* Friend of a friend (foaf)
* DBpedia (dbp)
* Schema (sch)
* Web Ontology Language (owl)
* RDF Schema (rdfs)
* Simple Knowledge Organisation System (skos)

Darüber hinaus wurde ein eigenes Vokabular "Linked swissbib (lsb)" verwendet, um Literale aus DBpedia zu speichern.

## Datentransformation

Das folgende Beispiel [Jane Austen's letters](https://www.swissbib.ch/Record/260865931) wurde aus einer MARC-Aufnahme von swissbib gebildet (d.h. mit der Software CBS bereits aus verschiedenen Bibliothekssystemen zusammengeführte Daten).

[![](/images/linked-swissbib-07a-jane-austen-katalog.png)](https://www.swissbib.ch/Record/260865931)

[![](/images/linked-swissbib-07b-jane-austen-marc.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-07b-jane-austen-marc.png)

### Bibliographic Resource

Um auszuwählen, welche MARC-Felder für das Konzept "Bibliographic Resource" genutzt werden sollen, wurde wie folgt vorgegangen:

* Die am häufigsten vorkommenden MARC Felder werden transformiert.
* Die für die Oberfläche notwendigen MARC Felder werden transformiert.

Daraufhin wurden 22 MARC-Felder ausgewählt. Bei der Transformation werden Links unter anderem auf die folgenden externen Webseiten gesetzt:

- geonames.org für Länder
- d-nb.info/gnd/ für Sachschlagworte
- lexvo.org für Sprache

[![](/images/linked-swissbib-08-bibliographic-resource.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-08-bibliographic-resource.png)

### Document und Item

Es erfolgte eine Trennung von bibliografischen Daten und administrativen Daten:

* Document: Metadaten über die bibliografischen Daten
* Item: Exemplar in einer Bibliothek

[![](/images/linked-swissbib-09-document.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-09-document.png)

[![](/images/linked-swissbib-10-item.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-10-item.png)

### Work

Das Werk-Konzept von Linked Swissbib ist aktuell nicht mit dem Werk aus [FRBR](https://en.wikipedia.org/wiki/Functional_Requirements_for_Bibliographic_Records) gleichzusetzen. Abgebildet werden weitere Ausgaben auf swissbib.ch. Das Clustering erfolgt in CBS mittels der Kriterien Titel, Autoren, ISBN und ISSN.

[![](/images/linked-swissbib-11-work.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-11-work.png)

### Person und Organisation

Personen werden, wenn möglich, als identisch erkannt und mit einer einheitlichen URI versehen. Die Dublettenerkennung erfolgt über einen "Author Hash" mit den folgenden Kriterien (in dieser Reihenfolge):

* GND
* Name, Titel der Person und Lebensdaten
* Name, Titel der Person und Titel der Publikation

Organisationen werden mit den Kriterien Name, Abteilung, Datum und Ort zusammengeführt, wenn möglich.

[![](/images/linked-swissbib-12-person.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-12-person.png)

Das Resultat der Datentransformation (vor der Anreicherung) auf einen Blick:

[![](/images/linked-swissbib-13-resultat-vor-anreicherung.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-13-resultat-vor-anreicherung.png)

## Umsetzung mit Metafacture

Für das Erstellen der RDF-Konzepte aus einem MARC-Satz wird das Werkzeug [Metafacture](https://github.com/metafacture/metafacture-core) genutzt. In linked.swissbib wird MarcXML in RDF (als JSON-LD) transformiert. Besonderheiten von Metafacture:

* Metafacture bietet die Möglichkeit, Workflows aus einzelnen Komponenten zusammenzubauen.
* Die Datentransformationen werden mit einer Domain Specific Language (DSL) konfiguriert. Durch die Verwendung einer DSL zur Erstellung von Konfigurationsdateien ist Metafacture prinzipiell auch für NichtprogrammiererInnen geeignet (die dann vielleicht Lust auf Mehr bekommen).
* Neben der Datentransformation ist auch die Analyse von Metadaten ein wichtiges Einsatzfeld.

Ein vergleichbares Werkzeug ist [Catmandu](http://librecat.org).

## Präsentation von Christoph Böhme (2015)

Im folgenden Kapitel 7.5 werden wir mit einer vorbereiteten Arbeitsumgebung mit Metafacture Beispieldaten in RDF transformieren. Um die Übung besser einordnen zu können, schauen Sie sich zunächst die folgende Präsentation an, die in die Konzepte von Metafacture einführt. Relevant sind hier die Folien 4 bis 18.

[![](/images/boehme-2014.png)](https://github.com/guenterh/htwChur20180111/blob/master/machwas/metafacture/dokus/presentation.cb.dnb.pdf)

Quelle: Präsentation von Christoph Böhme (Deutsche Nationalbibliothek) auf dem Metafacture-Workshop der SWIB 2014 in Bonn. Bereitgestellt von Günter Hipler auf GitHub unter <https://github.com/guenterh/htwChur20180111/blob/master/machwas/metafacture/dokus/presentation.cb.dnb.pdf>. Siehe auch komplette Workshop-Materialien unter <http://swib.org/swib14/slides/christoph_swib14_40.zip>

## Literatur zur Transformation von Bibliotheksmetadaten

* Beispiel für Mapping von MARC21 zu RDF <https://wiki.dnb.de/display/DINIAGKIM/MARC+21-RDF-Mapping>
* Christina Harlow (2015): Data Munging Tools in Preparation for RDF: Catmandu and LODRefine. <http://journal.code4lib.org/articles/11013>
