# 3.4 Tutorial zu OpenRefine

Bevor wir die im vorigen Abschnitt heruntergeladenen MARC21-Daten verarbeiten, sollten wir uns erst noch gründlicher mit OpenRefine vertraut machen und an das sehr kurze erste Erlebnis aus [Kapitel 1.6](/kapitel-1/16-metadaten-ansehen-mit-openrefine.md) anknüpfen.

Für OpenRefine gibt es eine [riesige Fülle von Tutorials](https://github.com/OpenRefine/OpenRefine/wiki/External-Resources), die den Einstieg erleichtern. Um die Funktionsweise kennenzulernen, ist es am einfachsten eins dieser Tutorials durchzuarbeiten.

## Aufgabe: Tutorial "Cleaning Data with OpenRefine" durcharbeiten

Wir bearbeiten jetzt das folgende selbsterklärende Tutorial:

> Seth van Hooland, Ruben Verborgh and Max De Wilde \(2013-08-05\): "Cleaning Data with OpenRefine" In: Programming Historian. [http://programminghistorian.org/lessons/cleaning-data-with-openrefine](http://programminghistorian.org/lessons/cleaning-data-with-openrefine)

Rufen Sie sich das Tutorial im Browser auf und starten dann OpenRefine. So können Sie zwischen den Browsertabs komfortabel hin und her schalten.

Falls Sie sich nicht mehr gut an OpenRefine erinnern, schauen Sie sich die Erläuterungen in [Kapitel 1.6 Metadaten ansehen mit OpenRefine](/kapitel-1/16-metadaten-ansehen-mit-openrefine.md) noch einmal an. Hier der Startbefehl:

```
~/openrefine-2.7/refine
```

## Hinweise

Die im Tutorial benannte Ausgangsdatei `phm-collection.tsv` können Sie unter folgender Adresse herunterladen: [http://data.freeyourmetadata.org/powerhouse-museum/phm-collection.tsv](http://data.freeyourmetadata.org/powerhouse-museum/phm-collection.tsv)

Achtem Sie beim Import auf die richtigen Einstellungen:

* Checkbox "_Parse cell text into numbers, dates, ..._" aktivieren
* Checkbox "_Quotation marks are used to enclose cells containing column separators_" deaktivieren

[![](/images/tutorial-openrefine-import.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/images/tutorial-openrefine-import.png)

Das steht zwar so auch im Tutorial, ist aber leicht zu übersehen.
