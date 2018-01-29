# 7.3 Projekt Linked swissbib

Artikel zu Linked Swissbib
https://www.frontiersin.org/articles/10.3389/fdigh.2017.00005/full

## Swissbib Architektur

Die Grafik zeigt die Systemarchitektur von swissbib im Jahre 2014, bevor das Projekt Linked swissbib gestartet ist. Besonderer Wert wurde auf die Trennung verschiedener Layer gelegt, die über Schnittstellen miteinander interagieren. Dadurch wurde es möglich, kommerzielle Software (OCLC CBS) mit Open-Source-Software zu mischen.

[![](/images/linked-swissbib-01-ausgangslage.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-01-ausgangslage.png)

## Ziele von linked.swissbib

1. Konversion des swissbib data sets in ein RDF Datenmodell (als Grundlage für Datenverknüpfungen)
2. Nutze die Möglichkeiten von verlinkten Informationen in eigenen Services und biete sie anderen zur Nachnutzung an
3. Verwendung von freier (möglichst erprobter) Software, entwickelt durch vergleichbare Institutionen. Entwicklungen sollten durch andere nachgenutzt werden können

Das Projekt startete 2014 als das Thema Linked Data für Bibliotheken noch vergleichsweise neu war und überwiegend theoretisch diskutiert wurde. Swissbib war prädestiniert für einen Praxistest, weil das Datenset von Swissbib schon umfassend ist und verschiedene Datenquellen beinhaltet. Die Nachnutzung der Projektergebnisse von linked swissbib für die Produktivumgebung von swissbib war von Beginn an ein erklärtes Ziel.

Das Projekt wurde von [swissuniversities](https://www.swissuniversities.ch) gefördert und gemeinsam von drei Partnern durchgeführt:
* Haute école de gestion de Genève: Schwerpunkt Datengenerierung
* Hochschule für Technik und Wirtschaft Chur: Schwerpunkt Oberfläche
* Universitätsbibliothek Basel: Schwerpunkt Infrastruktur

## Resultate

### Datentransformation

Aus etwa 29 Mio. MARC Aufnahmen wurden etwa 125 Mio. Dokumente in JSON-LD generiert, die in 6 Konzepte aufgeteilt sind:

1. Bibliographic Resource
2. Document
3. Item
4. Work
5. Person
6. Organisation

### Oberfläche

1. Suche

[![](/images/linked-swissbib-02-suche.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-02-suche.png)

2. Personenseiten

[![](/images/linked-swissbib-03-personenseite.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-03-personenseite.png)

### RESTful API

CC-0 Daten stehen unter der Adresse <http://data.swissbib.ch> zur Nachnutzung zur Verfügung.

[![](/images/linked-swissbib-04-api.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-04-api.png)

## Systemarchitektur mit linked.swissbib

Die folgende Grafik zeigt die Systemarchitektur von swissbib inklusive der neuen Komponenten von linked.swissbib. Anstelle eines üblichen SPARQL-Endpoints wurde eine eigene RESTFUL API auf Basis von Elasticsearch implementiert.

[![](/images/linked-swissbib-05-systemarchitektur.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-05-systemarchitektur.png)

## Workflow und Komponenten

* Die Datentransformation erfolgt mit Metafacture, zukünftig ergänzt um die Big-Data-Technologie Spark (dazu mehr in Kap. 7.4).
* Die Anreicherung erfolgt mit LIMES (dazu mehr in Kap. 7.6).
* Die Daten werden in einem Elasticsearch-Suchindex lokal gespeichert. Mehr Informationen zur Verwendung von Elastic Search ist einem Vortrag auf einem Meetup vom August 2016 zu entnehmen (vgl. [Video](https://www.elastic.co/videos/elasticsearch-as-hub-for-linked-bibliographic-metadata-zurich-meetup-august-2016) und [Folien](http://files.meetup.com/7646592/20160831 Elasticsearch as Hub for Linked Bibliographic Metadata.pdf))

[![](/images/linked-swissbib-06-workflow.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-06-workflow.png)
