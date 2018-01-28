# 4.5 Bonus: Weitere Daten indexieren

Um eine Meta-Suche über verschiedene Datenquellen zu ermöglichen, müssen alle Daten nach dem gleichen Schema indexiert werden. Nur wenn es große Überschneidungen bei den Suchfeldern gibt, macht eine übergreifende Suche mit Filtermöglichkeiten (Facetten) Sinn.

Wir haben mit Dublin Core bereits ein Schema verwendet, dass als kleinster gemeinsamer Nenner auch für andere Daten gut geeignet ist. Damit wir weitere Daten indexieren können, müssen wir diese also ebenfalls so transformieren, dass Sie dem Dublin Core Schema folgen.

In Kapitel 3 haben wir im OpenRefine Tutorial mit Daten des Powerhouse Museum gearbeitet. Diese Daten können wir indexieren, wenn wir zuvor die Spalten gemäß der Feldbezeichnungen in unserem Schema umbenennen. Weiterhin benötigt Solr immer einen eindeutigen Identifier pro Datensatz (bei unseren Tabellendaten also pro Zeile). 

## Aufgabe 1: Transformieren Sie die Daten des Powerhouse Museum mit OpenRefine

* Benennen Sie die Spalten so um, dass Sie auf die Feldbezeichnungen in unserem Schema (Dublin Core) passen. Die erste Spalte muss `id` lauten und muss mit einem eindeutigen Identifier versehen sein.
* Exportieren Sie die Daten als TSV

## Aufgabe 2: Indexieren Sie die Daten in Solr

* Verwenden Sie dazu den bekannten Befehl mit `curl` (vgl. Kap. 4.3/4.4)

## Lösung

Beispiele und Ergebnisse zu den obigen Aufgaben finden Sie auf der Seite [Lösungen](/losungen.md).
