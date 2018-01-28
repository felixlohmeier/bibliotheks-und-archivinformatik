# 4.3 Daten in Solr laden

## Solr beenden und starten

Solr wurde als Prozess gestartet, der bis zum nächsten Neustart des Rechners weiterläuft. Starten Sie jetzt Solr mit folgenden Befehlen neu, damit wir nicht mehr im Beispielverzeichnis `techproducts` arbeiten, sondern im Standardverzeichnis.

* Solr beenden:`~/solr-7.1.0/bin/solr stop -all`
* Solr starten:`~/solr-7.1.0/bin/solr start`

Etwa 15-30 Sekunden nach dem Startbefehl sollte die Administrationsoberfläche unter der gewohnten Adresse \([http://localhost:8983](http://localhost:8983)\) erreichbar sein.

## Index erstellen \(im Terminal\)

Erstellen Sie jetzt einen eigenen Suchindex mit dem Namen `htw`:

```
~/solr-7.1.0/bin/solr create -c htw
```

## Daten aus Kap. 3.5 laden \(im Terminal\)

Wir benötigen jetzt die in Kapitel 3.5 erstellten Testdaten. Falls Sie dort auf Probleme gestoßen sind, finden Sie auf der Seite [Lösungen](/losungen.md) eine Datei, die Sie hier nutzen können.

Der folgende Befehl indexiert die Daten aus der Datei `einstein.tsv` aus dem Ordner `Downloads` \(die Datei wird ganz am Ende mit der öffnenden spitzen Klammer als input benannt\) im Suchindex `htw`.

```
curl "http://localhost:8983/solr/htw/update/csv?commit=true&separator=%09&split=true&f.creator.separator=%E2%90%9F" --data-binary @- -H 'Content-type:text/plain; charset=utf-8' < ~/Downloads/einstein.tsv
```

Weitere Erläuterungen des Befehls:

* Die Basis der URL, die mit curl aufgerufen wird \(`http://localhost:8983/solr/htw/update/csv`\) ist die Adresse des CSV-Update-Handlers von Solr für den Index `htw`.
* Der Teil `commit=true` sorgt dafür, dass die Daten sofort in der Anzeige sichtbar werden.
* Bei TSV-Dateien muss das Trennzeichen \(`separator=%09`\) explizit mitgegeben werden.
* Solr muss außerdem mitgeteilt werden, dass Felder mehrfachbelegt sind \(`split=true`\) und mit welchem Zeichen diese jeweils getrennt sind \(`f.creator.separator=%E2%90%9F`\)
* Der ganze hintere Teil `--data-binary @- -H 'Content-type:text/plain; charset=utf-8'` ist spezifisch für das Senden von Dateien mit curl.

Weitere mehrfachbelegte Felder ergänzen Sie, indem Sie vor dem zweiten Anführungszeichen einen weiteren Teil wie folgt anfügen. Beispiel für das Feld `title`:

```
&f.title.separator=%E2%90%9F
```

Der komplette Befehl sieht dann wie folgt aus:

```
curl "http://localhost:8983/solr/htw/update/csv?commit=true&separator=%09&split=true&f.contributor.separator=%E2%90%9F&f.coverage.separator=%E2%90%9F&f.creator.separator=%E2%90%9F&f.date.separator=%E2%90%9F&f.description.separator=%E2%90%9F&f.extent.separator=%E2%90%9F&f.format.separator=%E2%90%9F&f.identifier.separator=%E2%90%9F&f.language.separator=%E2%90%9F&f.pages.separator=%E2%90%9F&f.publisher.separator=%E2%90%9F&f.title.separator=%E2%90%9F&f.type.separator=%E2%90%9F" --data-binary @- -H 'Content-type:text/plain; charset=utf-8' < ~/Downloads/einstein.tsv
```

## Prüfen Sie das Ergebnis

In der Browsing-Oberfläche \([http://localhost:8983/solr/htw/browse](http://localhost:8983/solr/htw/browse)\) können Sie prüfen, ob die Daten indexiert wurden. Sie werden feststellen, dass keine Daten im Index angekommen sind.

Schauen Sie noch einmal in das Terminal. Auf den `curl`-Befehl hatten Sie eine Rückmeldung erhalten, aus der das Problem ersichtlich ist. Darin steht unter anderem:

> Error adding field 'date'='uuuu' msg=For input string: \"uuuu\"

Fehlermeldungen finden Sie übrigens auch in der Administrationsoberfläche im Bereich "Logging": [http://localhost:8983/solr/\#/~logging](http://localhost:8983/solr/#/~logging)

Warum ist die Indexierung gescheitert?

* Solr versucht in der Standardeinstellung die Datentypen \(Text, Zahl, Datum, usw.\) automatisch zu erkennen und generiert daraus automatisch ein Schema. Wenn später in der Datei noch andere Daten folgen, die nicht zum "erratenen" Schema passen, dann bricht der Import ab.
* Die ersten Datensätze in unserer TSV-Datei enthalten in der Spalte `date` eine Jahreszahl (1967, 1980, 1979 usw.). Solr schließt daraus, dass das Feld `date` nur Zahlen beinhalten darf und verwendet den Feldtyp `plongs` (TrieLongField, 64-bit signed integer).
* In einem der hinteren Datensätze unserer TSV-Datei stehen in der Spalte `date` Buchstaben (uuuu). Buchstaben sind im Feldtyp `plongs` nicht zugelassen. Daher bricht der Import ab.

Wir müssen also entweder das Schema manuell definieren oder die Daten vereinheitlichen, damit wir diese erfolgreich indexieren können. Darum kümmern wir uns im nächsten Kapitel.

Das `u` steht übrigens für `Date element is totally or partially unknown` und ist im MARC-Feld `008` Zeichen 7-10 [explizit zugelassen](https://www.loc.gov/marc/bibliographic/bd008a.html). Da der Suchindex Apache Solr mit dem `u` aber nichts anfangen kann, hätten wir dies in der Transformation in Kapitel 3.5 berücksichtigen müssen. Eine Lösungsmöglichkeit wäre gewesen, die Ungenauigkeit durch einen Zeitraum (Anfangs- und Enddatum) auszudrücken. Dafür gibt es in Solr [weitreichende Möglichkeiten](https://lucene.apache.org/solr/guide/7_1/working-with-dates.html#WorkingwithDates-DateRangeFormatting).

## Literatur

* [Offizielle Anleitung zum Einspielen von CSV-Daten](https://lucene.apache.org/solr/guide/7_1/uploading-data-with-index-handlers.html#csv-formatted-index-updates)
