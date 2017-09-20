# 1.4 Metadatenstandards und Schnittstellen

## Fragen

* Welche Datenformate sind im Bibliotheksbereich üblich?
* Über welche Schnittstellen können Daten abgerufen werden?

## Zum Einstieg

"Die Datenübersetzerin" - [Interview mit Kirsten Jeude im Podcast der ZBW](https://www.youtube.com/watch?v=YwbRTDvt_sA)

[![](/images/interview-kirsten-jeude.png)](https://www.youtube.com/watch?v=YwbRTDvt_sA)

## Metadatenformate und -standards

Zusammenfassung einiger wichtiger Punkte mit Verweis auf Folien in einer Präsentation von Kirsten Jeude.

Siehe auch: Kirsten Jeude \(2013\): Auf Du und Du mit Dublin Core & Co. - Berufsfeld Metadaten-Management im Kontext der Bibliothek der Zukunft. Metadaten-Management im Leibniz-Informationszentrum Wirtschaft.[ Präsentationsfolien bei Slideshare](http://www.slideshare.net/suvanni/auf-du-und-du-mit-dublin-core-co-berufsfeld-metadatenmanagement-im-kontext-der-bibliothek-der-zukunft).

Es gibt viele verschiedene Definitionen für Metadaten, je nach Perspektive \(z.B. der IT, der KatalogbastlerInnen, der BibliothekarInnen usw.\). Grundsätzlich sind es \(vgl. Folie 13\) **strukturierte "Daten über Daten"**, also eine formale Beschreibung einer Vielzahl von Dingen \(Texte, Bilder, Objekte, Personen, usw.\). Metadaten sollen u.a. das Auffinden, Identifizieren, Auswählen und den Zugang zu einer Ressource erleichtern. Metadaten können getrennt vom beschriebenen Objekt in einer separaten Datei gespeichert oder in das Objekt eingebettet sein. Bilddateien wie JPG enthalten zum Beispiel eingebettete Metadaten \(Aufnahmedatum, Auflösung usw.\).

Da die Anforderungen an Metadaten kontextabhängig sind, gibt es eine Vielzahl an Standards, die sich entwickelt haben. Beispiele im Bibliothekswesen sind **PICA, MODS, DC, MAB, MARC21, METS, EAD, TEI, LIDO **\(vgl. Folie 44\). Diese Standards können technisch in verschiedenen Formaten \(Text, XML\) umgesetzt werden. Die Regeln der Standards werden oft in einem **Schema** dokumentiert, mit dem sich prüfen lässt, ob eine Datei \(technisch\) standardkonform ist. Wenn eine Anwendung genauere Festlegungen treffen will oder gar Elemente aus verschiedenen Standards kombiniert werden sollen, dann wird dies in einem ** Anwendungsprofil ** festgelegt \(vgl. Folie 59\).

Um Metadaten aus verschiedenen Quellen zusammenzuführen, ist meist ein "Übersetzen" der Daten aus verschiedenen Quellschemas \(MARC21, PICA\) in ein einheitliches Zielschema notwendig. Dieser Prozess wird **Mapping \(oder auch "Crosswalk"\)** genannt. Dabei gehen je nach Schema mehr oder weniger Informationen verloren. Es gibt Standard-Crosswalks zwischen Metadatenstandards, die als Grundlage dienen können. Da aber jede Einrichtung die Daten etwas anders erfasst \(ist ja nur menschlich\), lohnt es sich immer in die Daten zu schauen, wie die einzelnen Metadatenfelder wirklich befüllt sind. Die meisten Mappings werden daher teils auf Basis von Standard-Crosswalks, teils auf Basis von Beispieldaten erstellt \(zu Problemen beim "Mapping in der Praxis" vgl. die Folien 70ff\).

## Schnittstellen

Für den Austausch von Metadaten gibt es **Schnittstellen wie Z39.50, SRU oder OAI-PMH** \(vgl. Folie 86ff\). Die Anbieter erstellen in der Regel ausgehend von ihrem internen Datenformat die übrigen "Exportformate" automatisch. Dazu werden Übereinstimmungen zwischen den Feldern definiert, die wie gesagt als Mapping oder [Crosswalk](https://en.wikipedia.org/wiki/Schema_crosswalk) bezeichnet werden. Wenn nicht alle Daten aus dem internen Datenformat in das Zielformat passen \(wie zum Beispiel beim "kleinsten gemeinsamen Nenner" der Metadatenformate: Dublin Core\), dann gehen bei diesem Prozess Informationen verloren. Wenn alle Daten "verlustfrei" verarbeitet werden sollen, muss also grundsätzlich entweder mit dem internen \(auch: [nativ](http://www.duden.de/rechtschreibung/nativ)en\) Datenformat gearbeitet werden oder es muss genau \(in der Dokumentation\) geprüft werden, ob der Crosswalk zum Zielformat wirklich vollständig ist. Das Abrufen der Daten über Schnittstellen wird **"Harvesting"** genannt.

## Aggregatoren

Viele Non-Profit-Einrichtungen sammeln Daten aus verschiedensten Quellen, um diese gebündelt und in einem einheitlichen Schema zur Verfügung zu stellen. Der Prozess wird oft als Aggregieren, die Datenbereitsteller als Aggregatoren bezeichnet. Beispiele:

* Bibliotheksverbünde: Lokale Bibliotheksdaten, teilweise auch Bereitsteller von Indizes \(wie GBV Zentral\)
* CrossRef: Artikel aus elektronischen Zeitschriften mit DOIs
* Bielefeld Academic Search Engine \(BASE\): Inhalte aus Repositorien \(vorwiegend Open Access\)
* Deutsche Digitale Bibliothek bzw. Europeana

## Metadateninteroperabilität

* die Einigung auf ein einziges übergreifendes Metadatenformat ist nicht realistisch, weil verschiedene Ressourcen beschrieben werden sollen und verschiedene Anforderungen an die Daten gestellt werden \(und weil unterschiedliche Katalogisierungstraditionen bestehen\)
* Eine Interoperabilität zwischen Formaten muss durch Werkzeuge erreicht werden
* setzt offene Standards voraus

Die "Open Bibliographic Data Working Group" der Open Knowledge Foundation hat 2011 Prinzipien zu offenen bibliografischen Daten veröffentlicht \(vgl. [Webseite im Internet Archive](http://web.archive.org/web/20160426071002/http://openbiblio.net/principles/)\):

* Grundlage: [Open Definition](http://opendefinition.org) "Wissen ist offen, wenn jedeR darauf frei zugreifen, es nutzen, verändern und teilen kann"
* Empfohlene Lizenzen: Public Domain Dedication and License \(PDDL\) oder Creative Commons Zero \(CC0\)

Gemeinsam mit der Public Domain Working Group ist ein "Open Metadata Handbook" entstanden. Letzte stabile Version vom 12.3.2014: [https://en.wikibooks.org/w/index.php?title=Open\_Metadata\_Handbook&stable=1](https://en.wikibooks.org/w/index.php?title=Open_Metadata_Handbook&stable=1).

## Literatur {#literatur}

* Wikipedia zu Metadaten: [https://de.wikipedia.org/wiki/Metadaten](https://de.wikipedia.org/wiki/Metadaten)
* Onlinetutorial "Einführung in Metadaten und Metadatenformate" von Claudia Effenberger und Stefanie Rühle: [http://moodle.dnb.de/course/view.php?id=14](http://moodle.dnb.de/course/view.php?id=14)
* Kleines Handbuch der DINI AG KIM: [http://www.kim-forum.org/Subsites/kim/DE/Materialien/Handbuch/handbuch\_node.html](http://www.kim-forum.org/Subsites/kim/DE/Materialien/Handbuch/handbuch_node.html)



