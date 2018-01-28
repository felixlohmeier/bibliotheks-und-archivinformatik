# 1.6 Metadaten ansehen mit OpenRefine

[OpenRefine](http://www.openrefine.org) bietet eine grafische Oberfläche zur Analyse und Transformation von Daten, die ähnlich wie eine klassische Tabellenverarbeitungssoftware (MS Excel, LibreOffice Calc, usw.) aufgebaut ist. Wir nutzen diese Software im Seminar, weil sich mit der vertrauten grafischen Oberfläche im Tabellenformat ein schneller Überblick über die Daten gewinnen lässt und die Software mit verschiedenen Datenformaten umgehen kann.

Dem [Repository bei GitHub](https://github.com/OpenRefine/OpenRefine/graphs/contributors) ist zu entnehmen, wer wann zur Entwicklung der Software beigetragen hat. Aktuell gibt es wieder eine kontinuierliche Weiterentwicklung insbesondere in Verbindung mit Funktionen zur Nutzung von [Wikidata](https://www.wikidata.org).

## OpenRefine herunterladen und entpacken

Auf der Webseite von OpenRefine werden verschiedene Varianten zum [Download](http://openrefine.org/download.html) angeboten. Wir laden die Version OpenRefine 2.7 für das Betriebssystem Linux. Die Installationsanleitung auf der Webseite ist simpel: "Download, extract, then type ./refine to start."

Wir erledigen dies wieder mit der Kommandozeile \(MATE-Terminal\):

* Download: 
  `wget https://github.com/OpenRefine/OpenRefine/releases/download/2.7/openrefine-linux-2.7.tar.gz`
* Extract \(entpacken\): 
  `tar -xzf openrefine-linux-2.7.tar.gz`

Im Ordner `openrefine-2.7` finden Sie jetzt das Programm OpenRefine.

Als Standardeinstellung verwendet OpenRefine maximal 1400M Arbeitsspeicher. Wenn beim Import oder bei der Transformation der Speicher ausgeht (Absturz und entsprechende Meldungen im Terminal), kann dieser Wert erhöht werden. Die Einstellung ist in der Datei ```refine.ini``` in der Zeile ```REFINE_MEMORY=1400M``` mit einem Texteditor (hier beispielsweise Anwendungen/Zubehör/Pluma Text Editor) vorzunehmen.

## OpenRefine starten

```
~/openrefine-2.7/refine
```

Die Tilde \(`~`\) ist ein Kürzel für ihr Benutzerverzeichnis. Dieser Befehl funktioniert immer, egal in welchem Verzeichnis Sie sich gerade befinden. Wenn Sie sich im Ordner von OpenRefine befinden \(`cd ~/openrefine-2.7`\) reicht ein simples `refine`

Ist der Startvorgang erfolgreich, dann öffnet sich der Browser \(Firefox\) automatisch und Sie bekommen das Programm direkt angezeigt. OpenRefine ist in der Standardeinstellung unter der IP-Adresse [http://127.0.0.1:3333](http://127.0.0.1:3333) erreichbar.

Rufen Sie zunächst den Menüpunkt "Open Project" auf und klicken Sie ganz unten auf den Link "Browse workspace directory". Es öffnet sich der Ordner, in dem OpenRefine die Daten speichert. In der Standardkonfiguration unter Linux ist dies das Verzeichnis ```~/.local/share/openrefine```.

## Übung: Daten aus Kapitel 1.5 in OpenRefine laden

Im Menüpunkt "Create Project" auf den Button "Durchsuchen" klicken und eine der in Kapitel 1.5 gespeicherten XML-Dateien auswählen. Im nächsten Bildschirm unten links bei Parse data as "XML files" auswählen, dann im Vorschaubildschirm auf den Pfad ```<record xmlns:xs="http://www.w3.org/2001/XMLSchema">``` klicken und dann oben rechts den Button "Create Project" drücken.

OpenRefine "versteht" das MARC-Format nicht. Es interpretiert die Daten daher genauso wie jede andere XML-Datei. Wenn Sie die Daten erstmalig in OpenRefine öffnen, sehen Sie daher die üblichen Nummern und Codes für die jeweiligen MARC-Felder in der Baumstruktur der XML-Datei.

Die Bedeutung der MARC-Nummern und Codes müssen Sie nachschlagen. Zur Orientierung können Sie beispielsweise die [Arbeitstabelle der Deutschen Nationalbibliothek](http://www.dnb.de/SharedDocs/Downloads/DE/DNB/standardisierung/marc21FeldbeschreibungTitelExcel032016.zip) in der [Dokumentation des MARC21-Formats](http://www.dnb.de/DE/Standardisierung/Formate/MARC21/marc21_node.html) verwenden.

## Übung: Verschaffen Sie sich einen Überblick über die Daten(struktur) mit Hilfe von Facetten und Text Filtern

* Schauen Sie sich die Einführungsvideos zu OpenRefine an, insbesondere die ca. [7-Minuten-Kurzeinführung bei YouTube](https://www.youtube.com/watch?v=B70J_H_zAWM)
* Konsultieren Sie die [Seite zur Facettierung in der Dokumentation von OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki/Faceting) und probieren Sie verschiedene Facetten aus.
* Gute Übungen zum Einstieg bietet auch Library Carpentry OpenRefine: [Basic OpenRefine Functions I: Working with columns, sorting, faceting, filtering and clustering](https://data-lessons.github.io/library-openrefine/03-basic-functions-I/)

## OpenRefine beenden

OpenRefine ist nur solange verfügbar, wie der oben verwendete Befehl in der Kommandozeile läuft.

1. Beenden Sie OpenRefine mit ```STRG``` und ```C``` auf der Kommandozeile. Der Browser schließt sich automatisch.
2. Starten Sie OpenRefine erneut, indem Sie auf der Kommandozeile mit der ```Pfeiltaste nach oben``` den vorigen Befehl auswählen und mit ```Enter``` ausführen.

Auf der Kommandozeile können Sie übrigens mitverfolgen, wie der Browser und OpenRefine miteinander kommunizieren. Beim Aufruf von OpenRefine im Browser erscheinen beispielsweise die folgenden POST und GET Befehle in der Kommandozeile:

```
15:10:34.819 [                   refine] POST /command/core/load-language (19332ms)
15:10:34.940 [                   refine] POST /command/core/load-language (121ms)
15:10:35.223 [                   refine] POST /command/core/get-importing-configuration (283ms)
15:10:35.509 [                   refine] GET /command/core/get-all-project-metadata (286ms)
15:10:35.632 [                   refine] GET /command/core/get-languages (123ms)
15:10:35.721 [                   refine] GET /command/core/get-version (89ms)
```

OpenRefine führt alle Datentransformationen im Arbeitsspeicher durch und speichert die veränderten Daten automatisch alle 5 Minuten auf die Festplatte. Beim manuellen Beenden in der Kommandozeile werden ebenfalls alle Daten gespeichert. Verwenden Sie also stets die oben beschriebene Vorgehensweise mit ```STRG``` und ```C``` um OpenRefine ordnungsgemäß herunterzufahren. Ansonsten könnten Sie die Änderungen der (maximal) letzten 5 Minuten verlieren.
