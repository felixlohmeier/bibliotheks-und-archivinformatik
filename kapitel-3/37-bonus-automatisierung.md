# 3.7 Bonus: Automatisierung

Die Systemarchitektur von OpenRefine macht es möglich, die Anwendung nicht nur über die grafische Oberfläche, sondern auch über eine API "fernzusteuern". Für die [HTTP-API von OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki/OpenRefine-API) gibt es Clients in den Programmiersprachen Python, Ruby, node.js, PHP und für R. Am ausgereiftesten ist der [Python-Client von Paul Makepeace](https://github.com/PaulMakepeace/refine-client-py/).

Darauf aufbauend habe ich ein Shell-Script geschrieben, das gespeicherte Transformationsregeln auf eine Vielzahl von Dateien anwenden kann. Es lädt sich alle benötigten Komponenten wie beispielsweise den Python-Client automatisch aus dem Internet. Die zu verarbeitenden Daten und die Transformationsregeln (als JSON-Dateien) müssen vorab in Dateiordnern bereitgestellt werden. Das Script ist bei GitHub frei verfügbar: [felixlohmeier/openrefine-batch](https://github.com/felixlohmeier/openrefine-batch).

## Transformationshistorie

OpenRefine verfügt über hilfreiche Undo/Redo-Funktionen, mit denen Sie auch alle bisher in einem Projekt durchgeführten Transformationsregeln speichern und auf ein anderes Projekt anwenden können.

Transformationsregeln extrahieren (altes Projekt):

* Oben links im Reiter "Undo / Redo" den Button "Extract..." drücken
* Alles im rechten Textfeld in die Zwischenablage kopieren (z.B. mit ```STRG```+```A``` und ```STRG```+```C```)

Transformationsregeln anwenden (neues Projekt):

* Neues OpenRefine-Projekt mit ähnlichen oder gleichen Datenstrukturen erstellen
* Oben links im Reiter "Undo / Redo den Button "Apply..." drücken
* Den Inhalt der Zwischenablage einfügen (z.B. mit ```STRG```+```V```) und den Button "Perform Operations" drücken.

## Download des Shell-Scripts openrefine-batch

* Falls OpenRefine im Terminal noch läuft, beenden Sie es durch die Tastenkombination ```STRG```+```C```.
* Geben Sie im Terminal folgende Befehle ein:

```
wget https://github.com/felixlohmeier/openrefine-batch/archive/master.zip
unzip master.zip
cd openrefine-batch-master
chmod +x openrefine-batch.sh
```

## Tutorial aus Kapitel 3.4 automatisiert bearbeiten

In dem Download sind die Daten aus dem Tutorial enthalten. Wenn Sie mögen, können Sie die mitgelieferte JSON-Datei im Ordner examples/powerhouse-museum/config/ durch Ihre eigene Transformationshistorie ersetzen.

Geben Sie im Terminal folgenden Befehl ein, um das Script ```openrefine-batch.sh``` auf den mitgelieferten Beispieldaten laufen zu lassen:

```
./openrefine-batch.sh \
-a examples/powerhouse-museum/input/ \
-b examples/powerhouse-museum/config/ \
-c examples/powerhouse-museum/output/ \
-f tsv \
-i processQuotes=false \
-i guessCellValueTypes=true \
-RX
```