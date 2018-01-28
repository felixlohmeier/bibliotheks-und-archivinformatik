# 4.1 Installation von Solr

## Installation

Wir verwenden die Version 7.1 von Solr.

* Geben Sie im Terminal folgende Befehle ein, um diese Version herunterzuladen und zu entpacken:

```
wget http://archive.apache.org/dist/lucene/solr/7.1.0/solr-7.1.0.tgz
tar zxf solr-7.1.0.tgz
```

siehe auch: [Offizielle Installationsanleitung](https://lucene.apache.org/solr/guide/installing-solr.html)

## Solr mit Beispielkonfiguration starten

* Geben Sie im Terminal folgenden Befehl ein, um Solr mit der Beispielkonfiguration "techproducts" zu starten:

```
~/solr-7.1.0/bin/solr -e techproducts
```

* Laden Sie anschließend ein paar mitgelieferte Beispieldaten, damit in der integrierten Suchoberfläche etwas mehr zu sehen ist:

```
~/solr-7.1.0/bin/post -c techproducts ~/solr-7.1.0/example/exampledocs/*
```

siehe auch: [Offizielle Anleitung "Running Solr"](https://lucene.apache.org/solr/guide/running-solr.html)

## Administrations- und integrierte Suchoberfläche

Nach einer kurzen Wartezeit (max. 1 Minute) sollten folgende Oberflächen im Browser erreichbar sein:

* Administrationsoberfläche: <http://localhost:8983/>
* Integrierte Suchoberfläche: <http://localhost:8983/solr/techproducts/browse>
