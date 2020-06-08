# Metadaten modellieren und Schnittstellen nutzen

1. Transformation von Metadaten mit OpenRefine (15 Minuten)
2. XSLT Crosswalks mit MarcEdit (25 Minuten)
3. Austauschprotokolle für Metadaten (OAI-PMH, SRU) (45 Minuten)
4. Weitere Tools zur Metadatentransformation (10 Minuten)
5. Nutzung von JSON-APIs (20 Minuten)

## Transformation von Metadaten mit OpenRefine

**Aufgabe (ca. 4 Stunden):** [Library Carpentry Lesson zu OpenRefine](https://librarycarpentry.org/lc-open-refine/)

### Von OpenRefine unterstützte Formate

* Besonders geeignet für tabellarische Daten (CSV, TSV, XLS, XLSX und auch TXT mit Trennzeichen oder festen Spaltenbreiten)
* Einfaches "flaches" XML (z.B. MARCXML) oder JSON ist mit etwas Übung noch relativ einfach zu modellieren
* Komplexes XML mit Hierarchien (z.B. EAD) ist möglich, aber nur mit Zusatztools
* Kann in Kombination mit MarcEdit für MARC21 benutzt werden

### Einsatzmöglichkeiten von OpenRefine

* Exploration von Datenlieferungen
* Vereinheitlichung und Bereinigung (zur Datenqualität in der Praxis siehe Präsentation von Peter Király ["Validating 126 million MARC records"](https://docs.google.com/presentation/d/e/2PACX-1vRU4J_rln00UVD7pNPT0_02NOad0HfSk_UKqRI0v29y8QkMAplEDlyjc0Ot_VE_paV6WBW29Fh_V-iN/pub))
* Abgleich mit Normdaten ("Reconciliation") in Wikidata, GND und VIAF
* Für lokalen Einsatz ausgelegt (Installation auf Webservern und Automatisierung möglich, aber nur mit Zusatzsoftware)

## XSLT Crosswalks mit MarcEdit

**Aufgabe (ca. 4 Stunden):** [Library Carpentry Lesson zu MarcEdit](https://librarycarpentry.org/lc-marcedit/01-introduction/index.html) (noch in Entwicklung, aber brauchbar)

### Crosswalks? XSLT?

* Crosswalks
  * Gängiger Begriff, um die Konvertierung von einem Metadatenstandard in einen anderen zu beschreiben.
  * Beispiel: MARC21 zu Dublin Core.
  * Der "Crosswalk" beinhaltet Regeln wie Elemente und Werte zugeordnet/verändert werden müssen.
  * Im Idealfall verlustfrei, aber meist keine 1:1-Zuordnung möglich.
* XSLT
  * Programmiersprache zur Transformation von XML-Dokumenten (W3C Empfehlung, 1999)
  * Literaturempfehlung für Einstieg in XSLT: <https://programminghistorian.org/en/lessons/transforming-xml-with-xsl>

### XSLT mit MarcEdit

* Anleitung für "XML Conversion" mit MarcEdit von der Unibibliothek aus Illinois: <https://guides.library.illinois.edu/c.php?g=463460&p=3168159>
* Von MarcEdit verwendete XSLT Dateien liegen auch hier: <https://github.com/reeset/marcedit_xslt_files> und <https://github.com/reeset/marcedit-xslts>

### Gruppenarbeit

**Aufgabe (30 Minuten):**

* MarcEdit installieren (falls noch nicht erfolgt), siehe Erläuterungen unter <https://librarycarpentry.org/lc-marcedit/01-introduction/index.html>
* Beispieldatei herunterladen: <http://demonstrators.ostephens.com/training/data/me-eg-records.mrc>
* XSLT Transformationen ausprobieren: Button "MARC Tools"

## Austauschprotokolle für Metadaten (OAI-PMH, SRU)

### Schnittstellen SRU, OAI-PMH und Z39.50

Es gibt zahlreiche Übertragungsprotokolle im Bibliotheks- und Archivbereich. Drei davon sind besonders weit verbreitet:

* Z39.50 (Library of Congress)
* SRU - Search/Retrieve via URL (Library of Congress)
* OAI-PMH - Open Archives Initiative Protocol for Metadata Harvesting (Open Archives Initiative)

Note:
* Z39.50 ist sehr alt, aber immer noch im Einsatz. Meist wird das modernere SRU als Ergänzung angeboten.
* Während Z39.50 und SRU sich besonders für Live-Abfragen oder gezielten Datenabruf mit vielen Parametern eignet, zielt OAI-PMH vor allem auf größere Datenabzüge und regelmäßige Aktualisierungen.
* Das Schöne an SRU und OAI-PMH ist, dass die Anfragen als Internetadresse (URL) zusammengestellt werden können und direkt über den Browser ohne Zusatzsoftware aufrufbar sind.

### SRU und OAI am Beispiel von Swissbib

Das Projekt swissbib sammelt Metadaten aller schweizer Universitätsbibliotheken, der Nationalbibliothek und einiger Kantonsbibliotheken sowie weiterer Institutionen. Der gemeinsame Katalog ermöglicht eine übergreifende Suche, gleichzeitig bietet swissbib auch Schnittstellen an, über welche Metadaten der teilnehmenden Institutionen zentral bezogen werden können.

* Dokumentation Swissbib SRU: <http://www.swissbib.org/wiki/index.php?title=SRU>
* Dokumentation Swissbib OAI: <http://www.swissbib.org/wiki/index.php?title=Swissbib_oai>

#### Aufgabe 1

Lesen Sie die [Dokumentation zur SRU-Schnittstelle von Swissbib](http://www.swissbib.org/wiki/index.php?title=SRU) und stellen Sie eine Abfrage mit folgenden Parametern zusammen:

* Katalog der Bibliothek der FH Graubünden
* Suche über alle Felder nach Suchbegriff: open
* Format:MARC XML - swissbib

Sie können dazu das Formular auf der Webseite <http://sru.swissbib.ch> verwenden oder die URL anhand der Dokumentation selbst zusammenbauen.

#### Aufgabe 2

Laden Sie die gleichen Daten in anderen Metadatenstandards (z.B. Dublin Core) und vergleichen Sie.

Tipp: Öffnen Sie zwei Browserfenster nebeneinander, um die Unterschiede leichter sehen zu können.

Note:
* Swissbib nutzt XSL Stylesheets, um live bei einer Suchanfrage, die Daten in verschiedene Formate zu konvertieren.

#### Aufgabe 3

Lesen Sie die [Dokumentation zur OAI-Schnittstelle von Swissbib](http://www.swissbib.org/wiki/index.php?title=Swissbib_oai).

Laden Sie einige Datensätze aus dem gesamten Swissbib-Verbund, die seit dem 01.06.2020 verändert wurden im Format MARC21. Speichern Sie die Daten in der Datei `swissbib-2020-06-01.xml`.

#### Bonusaufgabe

Finden Sie heraus, nach welchen Regeln die SRU-Schnittstelle von Swissbib MARC21 in Dublin Core transformiert.

Tipp: Nutzen Sie den Explain-Befehl der SRU-Schnittstelle

## Weitere Tools zur Metadatentransformation

### Zur Motivation

Metadaten-Management in der Praxis, hier beim Leibniz-Informationszentrum Wirtschaft (ZBW) in Hamburg:
* Infoseite: <https://www.zbw.eu/de/ueber-uns/arbeitsschwerpunkte/metadaten/>
* Videointerview mit Kirsten Jeude: <https://www.youtube.com/watch?v=YwbRTDvt_sA>

### Tools

Prof. Magnus Pfeffer (2016): Open Source Software zur Verarbeitung und Analyse von Metadaten. Präsentation auf dem 6. Bibliothekskongress. <http://nbn-resolving.de/urn/resolver.pl?urn:nbn:de:0290-opus4-24490>

* Catmandu (Perl): <https://librecat.org>
* Metafacture (Java): <https://github.com/metafacture/metafacture-core>
* OAI harvester für die Kommandozeile: <https://github.com/miku/metha>
* siehe auch die vielen Tools zu MARC21: <https://wiki.code4lib.org/Working_with_MARC>

## Nutzung von JSON-APIs

### Beispiel für API: lobid-gnd

<https://lobid.org/gnd/api>

* Suchergebnisse als JSON
* Datensätze über ID direkt als JSON abrufen
* Bulk-Downloads mit JSON lines
* Was kann man damit bauen? Beispiel Autovervollständigung

### Beispiel für Tool: ScrAPIr

<https://scrapir.org>

* Das Tool erlaubt Daten von bekannten Webseiten zu beziehen
* genutzt werden dazu die APIs der Webseiten (in der Regel JSON)
* es werden auch Vorlagen für Code (Javascript, Python) bereitgestellt
* Beispiel YouTube: <https://scrapir.org/data-management?api=YouTube_API>

