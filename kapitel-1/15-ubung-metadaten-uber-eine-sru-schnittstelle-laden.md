# 1.5 Übung: Metadaten über eine SRU-Schnittstelle laden

Das Projekt [swissbib](https://www.swissbib.ch) sammelt Metadaten aller schweizer Universitätsbibliotheken, der Nationalbibliothek und einiger Kantonsbibliotheken sowie weiterer Institutionen. Der gemeinsame Katalog ermöglicht eine übergreifende Suche, gleichzeitig bietet swissbib auch Schnittstellen an, über welche Metadaten der teilnehmenden Institutionen zentral bezogen werden können.

In der folgenden Übung nutzen wir die SRU-Schnittstelle \(SRU steht für [Search/Retrieve via URL](http://www.loc.gov/standards/sru/)\).

## Aufgabe 1: 10 Records über die SRU-Schnittstelle von swissbib laden {#aufgabe-1-100-records-über-die-sru-schnittstelle-laden}

Lesen Sie die [Dokumentation zur SRU-Schnittstelle von Swissbib](http://www.swissbib.org/wiki/index.php?title=SRU) und stellen Sie eine Abfrage mit folgenden Parametern zusammen:

* Katalog der Bibliothek der HTW Chur
* Suche über alle Felder nach Suchbegriff: `open`
* Format:`MARC XML - swissbib`

Sie können dazu das Formular auf der Webseite [http://sru.swissbib.ch](http://sru.swissbib.ch) verwenden oder die URL anhand der Dokumentation selbst zusammenbauen.

## Aufgabe 2: Laden Sie die gleichen Daten in anderen Formaten \(z.B. Dublin Core\) und vergleichen Sie

Tipp: Öffnen Sie zwei Browserfenster nebeneinander, um die Unterschiede leichter sehen zu können.

![](/images/swissbib-sru.png)

