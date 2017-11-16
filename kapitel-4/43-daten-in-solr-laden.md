# 4.3 Daten in Solr laden

## Solr beenden und starten

Solr wurde als Prozess gestartet, der bis zum nächsten Neustart des Rechners weiterläuft. Starten Sie jetzt Solr mit folgenden Befehlen neu, damit wir nicht mehr im Beispielverzeichnis `techproducts` arbeiten, sondern im Standardverzeichnis.

* Solr beenden:`~/solr-7.1.0/bin/solr stop -all`
* Solr starten:`~/solr-7.1.0/bin/solr start`

Etwa 15-30 Sekunden nach dem Startbefehl sollte die Administrations- und die Browsingoberfläche unter den gewohnten Adressen erreichbar sein.

## Index erstellen \(im Terminal\)

Erstellen Sie jetzt einen eigenen Suchindex mit dem Namen `htw`:

```
~/solr-7.1.0/bin/solr create -c htw
```

## Daten aus Kap. 3.5 laden \(im Terminal\)

Der folgende Befehl indexiert die Daten aus der Datei `einstein.tsv` aus dem Ordner `Downloads` \(ganz am Ende mit der öffnenden spitzen Klammer als input benannt\) im Suchindex `htw`.

```
curl "http://localhost:8983/solr/htw/update/csv?commit=true&separator=%09&split=true&f.creator.separator=%E2%90%9F" --data-binary @- -H 'Content-type:text/plain; charset=utf-8' < ~/Downloads/einstein.tsv
```

Erläuterungen des Befehls:

* Die Basis der URL, die mit curl aufgerufen wird \(`http://localhost:8983/solr/htw/update/csv`\) ist die Adresse des CSV-Update-Handlers von Solr für den Index `htw`.
* Der Teil `commit=true` sorgt dafür, dass die Daten sofort in der Anzeige sichtbar werden.
* Bei TSV-Dateien muss das Trennzeichen \(`separator=%09`\) explizit mitgegeben werden.
* Solr muss außerdem mitgeteilt werden, dass Felder mehrfachbelegt sind \(`split=true`\) und mit welchem Zeichen diese jeweils getrennt sind \(`f.title.separator=%E2%90%9F`\)
* Der ganze hintere Teil `--data-binary @- -H 'Content-type:text/plain; charset=utf-8'` ist spezifisch für das Senden von Dateien mit curl.

Weitere mehrfachbelegte Felder ergänzen Sie, indem Sie vor dem zweiten Anführungszeichen einen weiteren Teil wie folgt anfügen. Beispiel für das Feld `year`:

```
&f.year.separator=%E2%90%9F
```

## Prüfen Sie das Ergebnis

Gegebenenfalls erhalten Sie bereits auf den `curl`-Befehl eine Fehlermeldung, dass Daten nicht zum Schema passen. Solr versucht in der Standardeinstellung die Datentypen \(Text, Zahl, Datum, usw.\) automatisch zu erkennen und generiert daraus automatisch ein Schema. Wenn später in der Datei noch andere Daten folgen, die nicht zum "erratenen" Schema passen, dann bricht der Import ab. Dieses Problem behandeln wir im folgenden Kapitel.

Fehlermeldungen finden Sie in der Administrationsoberfläche im Bereich "Logging": [http://localhost:8983/solr/\#/~logging](http://localhost:8983/solr/#/~logging)

Rufen Sie die Browsing-Oberfläche auf \([http://localhost:8983/solr/gettingstarted/browse](http://localhost:8983/solr/gettingstarted/browse)\). Machen Sie ein paar Beispielsuchen, um sicherzugehen, dass die Daten richtig indexiert wurden.

## Falls etwas völlig schiefgeht...

Der folgende Befehl löscht alle Daten im Index `htw`:

```
curl "http://localhost:8983/solr/htw/update?commit=true&stream.body=%3Cdelete%3E%3Cquery%3E*%3A*%3C/query%3E%3C/delete%3E"
```

Wenn auch andere Einstellungen \(wie z.B. das Schema\) durch fehlerhafte Importe verhunzt sind, dann können Sie im Administrationsbereich "Core Admin" auch den ganzen Suchindex \("Core"\) inklusive aller Einstellungen löschen. Das Löschen wird dort vornehm als "unload" bezeichnet.

[http://localhost:8983/solr/\#/~cores/htw](http://localhost:8983/solr/#/~cores/htw)

Anschließend können Sie oben beim Abschnitt "Index erstellen" wieder beginnen.

## Literatur

* [Offizielle Anleitung zum Einspielen von CSV-Daten](https://lucene.apache.org/solr/guide/7_1/uploading-data-with-index-handlers.html#csv-formatted-index-updates)



