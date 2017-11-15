# 4.4 Konfiguration des Solr Schemas

Ab Solr Version 6.0 ist das sogenannte "managed schema" (auch "schemaless mode" genannt) voreingestellt. Solr analysiert bei der Indexierung die Daten und versucht das Schema selbst zu generieren. Felder können aber weiterhin zusätzlich manuell definiert werden.

## Schema über Admin-Oberfläche konfigurieren

* Admin-Oberfläche aufrufen. Im Menü "Core Selector" den Index "htw" auswählen. Dann im zweiten Menü "Schema" aufrufen. Direktlink: <http://localhost:8983/solr/#/htw/schema>
* Button "Add Field" drücken
* Name eingeben (Groß- und Kleinschreibung ist wichtig)
* `field type` (z.B. string) auswählen
* ggf. die Checkbox `multivalued` markieren, wenn das Feld mehrere Werte (getrennt durch ein Trennzeichen) enthält

## "Catchall" Copy Field anlegen

In der Standardkonfiguration gibt es keine übergreifende Suche. Im [Query-Interface](http://localhost:8983/solr/#/htw/query) und in der [integrierten Suchoberfläche](http://localhost:8983/solr/techproducts/browse) müsste stets ein Feld bei der Suche definiert werden. Damit ähnlich wie bei dem `techproducts`-Tutorial eine freie Texteingabe möglich wird, definieren wir eine Kopieranweisung aller Werte (`*`) in das Standard-Feld (`_text_`).

* Button "Add Copy Field" drücken
* source: `*`
* destination: `_text_`

## Neuindexierung

Damit die Änderungen wirksam werden, müssen wir die Daten erneut indexieren.

Schritt 1: Index leeren:

```
curl "http://localhost:8983/solr/htw/update?commit=true&stream.body=%3Cdelete%3E%3Cquery%3E*%3A*%3C/query%3E%3C/delete%3E"
```

Schritt 2: `einstein.tsv` indexieren:

```
curl "http://localhost:8983/solr/htw/update/csv?commit=true&separator=%09&split=true&f.title.separator=%E2%90%9F" --data-binary @- -H 'Content-type:text/plain; charset=utf-8' < einstein.tsv
```

## Literatur

* [Exercise 2: Modify the Schema and Index Films Data (im Solr Tutorial)](http://lucene.apache.org/solr/guide/7_1/solr-tutorial.html#exercise-2)
* [Einführungsartikel zu "Managed Schema"](https://support.lucidworks.com/hc/en-us/articles/221618187-What-is-Managed-Schema-)
* [Einführungsartikel zur Definition von Feldern im Schema](http://www.solrtutorial.com/schema-xml.html)
