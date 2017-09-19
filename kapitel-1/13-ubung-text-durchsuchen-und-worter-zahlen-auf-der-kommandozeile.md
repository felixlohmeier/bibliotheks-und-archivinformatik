# 1.3 Übung: Text durchsuchen und Wörter zählen auf der Kommandozeile

Im Laufe des Kursus verwenden wir des Öfteren die [Kommandozeile](https://de.wikipedia.org/wiki/Kommandozeile), um Programme zu installieren und zu konfigurieren. Gleichzeitig ist sie ein mächtiges Werkzeug, um mit Textdateien umzugehen. Es lohnt also den Umgang damit kurz zu üben.

## Kommandozeile \(Terminal\) starten {#kommandozeile-terminal-starten}

Die Kommandozeile \(auch "[Terminal](https://wiki.ubuntuusers.de/Terminal/)" genannt\) von Ubuntu MATE erreichen wir über das Menü "Anwendungen -&gt; Systemwerkzeuge -&gt; MATE-Terminal".

![](/images/mate-terminal.png)

## Installieren Sie das kleine Programm curl {#installieren-sie-das-kleine-programm-curl}

Für die folgende Übung wird das \(sehr\) kleine Programm curl benötigt. Bei vielen Linux-Distributionen ist es vorinstalliert, aber bei Ubuntu MATE nicht. Starten Sie zur Installation die Kommandozeile \(Terminal\) und geben Sie den folgenden Befehl ein:

`sudo apt-get install curl`

Nach dem kurzen Installationsprozess sollte es etwa so aussehen:

![](/images/curl-installieren.png)

## Übung: Text durchsuchen und Wörter zählen {#übung-text-durchsuchen-und-wörter-zählen}

Starten Sie die Kommandozeile \(Terminal\) und geben Sie die folgenden Befehle ein:

### Schritt 1: "War and Peace" von Leo Tolstoy herunterladen und anzeigen {#schritt-1-war-and-peace-von-leo-tolstoy-herunterladen-und-anzeigen}

* `curl http://www.gutenberg.org/files/2600/2600-0.txt `
  `>`
  ` war_and_peace.txt`
* `cat war_and_peace.txt | less`

Der Anhang `| less` am zweiten Befehl zeigt den Text so an, dass Sie mit den Pfeiltasten scrollen können. Beenden können Sie die Ansicht mit der Taste `q`.

### Schritt 2: Zeilen, Wörter und Zeichen zählen mit wc {#schritt-2-zeilen-wörter-und-zeichen-zählen-mit-wc}

* `wc war_and_peace.txt`

Die drei Nummern sind Zeilen, Wörter und Zeichen \(in dieser Reihenfolge\).

### Schritt 3: Suche nach Vorkommnissen der Wörter "war" and "peace" {#schritt-3-suche-nach-vorkommnissen-der-wörter-war-and-peace}

* `cat war_and_peace.txt | grep -i -ow war | wc`
* `cat war_and_peace.txt | grep -i -ow peace | wc`

Was wird häufiger in diesem Text erwähnt? Krieg oder Frieden?

## Hilfreiche Grundlagen bei der Arbeit mit der Kommandozeile {#hilfreiche-grundlagen-bei-der-arbeit-mit-der-kommandozeile}

* Dateien und Verzeichnisse: siehe [Cheatsheet](http://cheatsheetworld.com/programming/unix-linux-cheat-sheet/)
* Abbruch / Programm beenden: _**STRG**_ und _**C**_
* Kurzhilfe eines Programms aufrufen: _**Programmname**_** --help**
* Handbuch eines Programms aufrufen: **man **_** Programmname**_
* Automatische Ergänzung von Befehlen: _**Tab**_
* Vorige Kommandos anzeigen: _**Pfeiltaste nach oben**_
* Suche in Historie der Kommandozeile: _**STRG**_ und _**R**_

Die meisten Antworten finden sich über einfache Suchen im Internet. Meist reicht es an die passenden Suchbegriffe das Wort "linux" mit anzuhängen.

## Literatur {#literatur}

* Ausführlichere Übung im Blog des Projekts Librecat/Catmandu: [https://librecatproject.wordpress.com/2014/12/04/day-4-grep-less-and-wc/](https://librecatproject.wordpress.com/2014/12/04/day-4-grep-less-and-wc/). Dabei bitte beachten: Die dort referenzierte Textdatei ist anders strukturiert als die obige _war\_and\_peace.txt_ und liefert daher andere Zählergebnisse.
* Dreistündiger Einführungskurs "Shell Lessons for Librarians" im Projekt "Library Carpentry" 
  [http://data-lessons.github.io/library-shell/](http://data-lessons.github.io/library-shell/)
* Eine gute Einführung in die Linux-Kommandozeile bietet [http://linuxcommand.org](http://linuxcommand.org) von William E. Shotts, der auch ein kostenfreies [540-Seiten-Buch](http://linuxcommand.org/tlcl.php) darüber geschrieben hat.
* Es gibt sehr viele praktische kleine Programme auf der Kommandozeile. Zur Übersicht eignet sich daher ein Spickzettel \("Cheatsheet"\) sehr gut. Ein Beispiel für die unzähligen Cheatsheets: 
  [http://cheatsheetworld.com/programming/unix-linux-cheat-sheet/](http://cheatsheetworld.com/programming/unix-linux-cheat-sheet/).



