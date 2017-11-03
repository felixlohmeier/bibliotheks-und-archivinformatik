# 3.1 Wir bauen uns ein "Wissensportal"

[![](/flowcharts/flowchart-swissbib.png)](https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/flowcharts/flowchart-swissbib.png)Quellcode für Flowchart: [flowcharts/flowchart-swissbib.mmd](/flowcharts/flowchart-swissbib.mmd "Sourcecode") \(nutzbar im [Mermaid Live-Editor](https://mermaidjs.github.io/mermaid-live-editor/)\)

## Datenfluss

Das obige Bild zeigt den Datenfluss vom Abruf externer Daten über eine Schnittstelle bis hin zur Bereitstellung dieser Daten in einem Discovery-System. Das wollen wir bauen und so gehen wir vor:

* Wir laden heute eine Reihe von Testdaten aus Bibliothekssystemen über die SRU-Schnittstelle von Swissbib \(Kap 3.3\). Diese Daten transformieren wir mit OpenRefine von MARC21/XML in das Tabellenformat TSV \(Kap. 3.5\).
* In [Kapitel 4](/kapitel-4.md) \(16.11.17\)  werden wir den Suchindex Apache Solr installieren, kennenlernen, ein Datenmodell für eine Meta-Suche modellieren und dann die Testdaten als TSV indexieren.
* In [Kapitel 5](/kapitel-5.md) \(30.11.17\) werden wir schließlich das Content-Management-System TYPO3 mit der Erweiterung TYPO3-find installieren und unsere eigene Katalogoberfläche konfigurieren.

Danach haben wir noch zwei Kapitel Zeit, um entweder...

1. mit der gleichen Software weitere Datenquellen zu integrieren \(insbesondere aus Archivsystemen\) und das Datenmodell sowie das Relevanzranking daraufhin anzupassen,
2. oder das Discovery-System [VuFind](https://vufind.org) zu installieren, kennenzulernen und mit den enthaltenen Tools den obigen "händischen" Gesamtworkflow noch einmal professioneller aufzubauen.

In jedem Fall werden wir abschließend noch lernen, wie wir selbst Schnittstellen bereitstellen und wie wir uns mit der Linked Data Cloud verbinden können.