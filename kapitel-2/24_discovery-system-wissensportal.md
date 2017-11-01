# 2.4 Discovery-System Wissensportal

Wie in [Kapitel 2.1](21_metadatenflusse-der-eth-bibliothek.md) beschrieben, werden alle Ressourcen im "Wissensportal" zusammengeführt, um eine übergreifende Suche für die Nutzer zu ermöglichen. Das [Wissensportal](http://www.library.ethz.ch/) ist das zentrale Discovery-Tool für Recherchen in den Informationsquellen der ETH-Bibliothek. Es integriert Daten aus dem Bibliothekssystem Aleph und mehreren Fachanwendungen. Das Discovery-System ist mit dem Produkt [Primo](http://www.exlibrisgroup.com/de/category/Primo) realisiert.

## Zweck des Discovery-Systems

* Verbesserung der Suchfunktionen des OPACs
* Integration aller Ressourcen (nicht nur klassische Bibliotheksdaten) in eine Suchoberfläche
* Zusätzliche lizenzpflichtige Ressourcen können direkt von den Herstellern bezogen und im Discovery-Tool nachgewiesen werden

## Datenfluss ins Wissensportal

Datenquellen kommen über sogenannte "Pipes" ins System, die in Primo konfiguriert werden können:
1. Harvesting (via Dateisystem oder OAI)
2. Normalisierung der Daten und Speicherung in eigenem Format (PNX)
3. Indexierung der Daten

Bei der Normalisierung der Daten für die übergreifende Suche im Wissensportal ist ein Informationsverlust nicht immer zu vermeiden. Gleichzeitig werden bei der Zusammenführung ins "Wissensportal" auch Daten (z.B. aus Normdaten) angereichert, so dass für bestimmte Daten auch ein Informationsgewinn im Vergleich zum Quellsystem entstehen kann.

## Beispiel Hochschularchiv

Die Daten des Hochschularchivs werden von der Software Primo über eine spezielle OAI-PMH-Schnittstelle (vgl. dazu [Kapitel 2.5](25_datenbereitstellung-fur-externe-portale.md)) der Archivsoftware CMISTAR eingesammelt.

Dabei müssen die hierarchisch gegliederten Erschließungsinformationen (nach ISAD(G)) in eine flache Struktur gebracht werden. Dazu wird jede Verzeichnungseinheit innerhalb der Tektonik als einzelner Datensatz im Wissensportal abgebildet.

## Übung: Vergleich Archivsystem und Discovery-System

Vergleichen Sie die Einträge im Archivsystem und im Wissensportal am Beispiel einer Postkarte von Albert Einstein an Alfred Stern.

1. [Datensatz im Archivsystem](http://archivdatenbank-online.ethz.ch/hsa/#/content/d8edf79020994271b0b8289728f7624d)
2. [Datensatz im Wissensportal](http://www.library.ethz.ch/DADS:default_scope:cmistard8edf79020994271b0b8289728f7624d) (siehe auch: [Internes Format (PNX)](http://www.library.ethz.ch/DADS:default_scope:cmistard8edf79020994271b0b8289728f7624d&showPnx=true))

Fragen:

* Wie werden Informationen zur Erschließungshierarchie im Wissensportal abgebildet? (in der Trefferliste und in der Detailansicht)
* Welche Informationen fließen in die Facetten des Wissensportals ein?
* Fehlen Ihnen im Wissensportal entscheidende Informationen?
* Welche Art der beiden Suchen und Anzeigen bevorzugen Sie? Weshalb?

## Diskussion: Discovery oder Spezialdatenbank?

Um zu klären, welche Metadaten in das Discovery-System (hier: Wissensportal) übernommen werden, muss geklärt werden, welche Informationen zu welchem Zeitpunkt für die Nutzer relevant sind. Es gibt unterschiedliche Erwartungen der Nutzer, welche Informationen Sie in den verschiedenen Rechercheangeboten erhalten.

Das Wissensportal der ETH-Bibliothek ist als übergreifende Suche konzipiert, während die weiteren Recherchesysteme als Spezialdatenbanken für vertiefende Recherchen gedacht sind. Das Discovery-System soll unter anderem durch die Zusammenführung von unterschiedlichen Bibliotheks- und Archivressourcen das Prinzip der [Serendipity](https://de.wikipedia.org/wiki/Serendipit%C3%A4t) unterstützen.

Diesem Konzept folgend wird im Wissensportal aus allen Systemen eine leicht reduzierte Informationsmenge zusammengeführt, quasi den "größten gemeinsamen Nenner". Gleichzeitig werden Informationen wie beispielsweise Cover für eine visuelle Orientierung sowie Verfügbarkeitsinformationen bei der Zusammenführung ergänzt.