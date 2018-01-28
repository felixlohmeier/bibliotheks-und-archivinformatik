# 4.4 Konfiguration des Solr Schemas

Ab Solr Version 6.0 ist das sogenannte "managed schema" \(auch "schemaless mode" genannt\) voreingestellt. Solr analysiert bei der Indexierung die Daten und versucht das Schema selbst zu generieren. Felder können aber weiterhin zusätzlich manuell definiert werden.

Rufen Sie dazu die Admin-Oberfläche auf. Wählen Sie im Menü "Core Selector" den Index "htw" und dann im zweiten Menü den Punkt "Schema". Direktlink: [http://localhost:8983/solr/\#/htw/schema](http://localhost:8983/solr/#/htw/schema)

## Automatisch erkanntes Feld date löschen

Durch die Indexierung in Kapitel 4.3 hat Solr automatisch einige Felder im Schema definiert. Rufen Sie im Menü das Feld `date` auf. Sie werden sehen, dass als Feldtyp `plongs` definiert wurde. Direkte Änderungen sind hier nicht möglich, daher drücken Sie den Button `delete field` und bestätigen Sie die Sicherheitsabfrage mit `delete`.

## Feld date manuell neu anlegen

Nun können wir das Feld `date` manuell definieren. Gehen Sie dazu wie folgt vor:

* Button "Add Field" drücken
* Name `date` eingeben \(Groß- und Kleinschreibung ist wichtig\)
* Als `field type` die Option `text_general` auswählen (damit ist fast alles erlaubt)
* Button `Add field` drücken

## "Catchall" Copy Field anlegen

In der Standardkonfiguration gibt es keine übergreifende Suche. Im [Query-Interface](http://localhost:8983/solr/#/htw/query) und in der [integrierten Suchoberfläche](http://localhost:8983/solr/techproducts/browse) müsste stets ein Feld bei der Suche definiert werden. Damit ähnlich wie bei dem `techproducts`-Tutorial eine freie Texteingabe möglich wird, definieren wir eine Kopieranweisung aller Werte \(`*`\) in das Standard-Feld \(`_text_`\).

* Button "Add Copy Field" drücken
* source: `*`
* destination: `_text_`

## Neuindexierung

Damit die Änderungen wirksam werden, müssen wir die Daten erneut indexieren.

Schritt 1: Index leeren:

```
curl "http://localhost:8983/solr/htw/update?commit=true" -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
```

Schritt 2: `einstein.tsv` indexieren \(hier mit Mehrfachbelegungen\):

```
curl "http://localhost:8983/solr/htw/update/csv?commit=true&separator=%09&split=true&f.contributor.separator=%E2%90%9F&f.coverage.separator=%E2%90%9F&f.creator.separator=%E2%90%9F&f.date.separator=%E2%90%9F&f.description.separator=%E2%90%9F&f.extent.separator=%E2%90%9F&f.format.separator=%E2%90%9F&f.identifier.separator=%E2%90%9F&f.language.separator=%E2%90%9F&f.pages.separator=%E2%90%9F&f.publisher.separator=%E2%90%9F&f.title.separator=%E2%90%9F&f.type.separator=%E2%90%9F" --data-binary @- -H 'Content-type:text/plain; charset=utf-8' < ~/Downloads/einstein.tsv
```

## Ergebnis prüfen

Rufen Sie nun erneut die Browsing-Oberfläche \([http://localhost:8983/solr/htw/browse](http://localhost:8983/solr/htw/browse)\) auf. Jetzt sollten die Daten erscheinen und suchbar sein.


## Literatur

* [Exercise 2: Modify the Schema and Index Films Data \(im Solr Tutorial\)](http://lucene.apache.org/solr/guide/7_1/solr-tutorial.html#exercise-2)
* [Einführungsartikel zu "Managed Schema"](https://support.lucidworks.com/hc/en-us/articles/221618187-What-is-Managed-Schema-)
* [Einführungsartikel zur Definition von Feldern im Schema](http://www.solrtutorial.com/schema-xml.html)
