# 7.6 Verlinkung und Anreicherung

## Vorgehen

* Nur Personen werden verlinkt
* Verlinkung mit VIAF und DBpedia
* Matching über Vorname / Nachname / Lebensdaten oder GND-Nummer
* swissbib-Person wird angereichert mit den Informationen aus VIAF und DBpedia

## Person: VIAF, DBpedia, swissbib

[![](/images/linked-swissbib-14-person.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-14-person.png)

## Person: VIAF, DBpedia, swissbib - Matching (GND-ID)

[![](/images/linked-swissbib-16-person-matching-gnd.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-16-person-matching-gnd.png)

## Person: VIAF, DBpedia, swissbib - Matching (Name, Lebensdaten)

[![](/images/linked-swissbib-17-person-matching-lebensdaten.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-17-person-matching-lebensdaten.png)

## Person: Anreicherung

[![](/images/linked-swissbib-15-person-anreicherung.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-15-person-anreicherung.png)

## Resultat

[![](/images/linked-swissbib-18-resultat-nach-anreicherung.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/linked-swissbib-18-resultat-nach-anreicherung.png)

## Verlinkung mit LIMES

[LIMES](http://aksw.org/Projects/LIMES.html) ist ein Open-Source-Projekt der Uni Leipzig. Es dient der automatisierten Verknüpfung von identischen Ressourcen.

Das Ziel ist hier Übereinstimmungen zwischen den 25 Mio. swissbib-Personen und den Personen in DBPedia und VIAF herzustellen.

Technisch werden diese Übereinstimmungen über eine sameAs-Beziehung gekennzeichnet. Beispiel für ein generiertes RDF triple:

```
<http://data.swissbib.ch/person/8004f8a7-66e6-3880-a4fc-b2b8ae136084>
<owl:sameAs>
<http://dbpedia.org/resource/Waldo_Rudolph_Wedel>
```

## Schritte des linking workflows bei swissbib

* Download eines Datendumps von DBPedia / VIAF im RDF Format
* Aufbereitung beider Datendumps (Stichwort: sortierte n-triples)
* Transformation des kompletten swissbib Bestandes nach RDF mit Metafacture und Vorbereitung der Personentriples zum Vergleich mit Limes (auch hier im Format n-triples)
* Suche nach owl:same Verbindungen mit limes
* "Nachbereitung" der gefunden Verbindungen (zum Beispiel Speicherung im Triple-Store)

## Datenqualität

* Projekt zeigt was mit den vorhandenen Daten möglich ist... und was nicht
* Matching von Personen ist schwierig, da oft nur Name und Vorname vorhanden
* Für die Mehrheit der Personen kann kein Match erzielt werden
* Gute Datenqualität ist Voraussetzung für Verlinkung!

## Literatur

* Dokumentation der einzelnen Schritte: <https://guenterh.gitbooks.io/dokumentation-ablauf-linking-mit-limes/content/ubersicht-gesamter-workflow.html>
* Bensmann, F., Zapilko, B., & Mayr, P. (2017). Interlinking Large-scale Library Data with Authority Records. Frontiers in Digital Humanities, 4. <https://doi.org/10.3389/fdigh.2017.00005>
