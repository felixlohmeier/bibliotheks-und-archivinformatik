# 1.6 Metadaten ansehen mit OpenRefine

## OpenRefine herunterladen und entpacken {#openrefine-herunterladen-und-entpacken}

Auf der Webseite von OpenRefine werden verschiedene Varianten zum [Download](http://openrefine.org/download.html) angeboten. Wir laden die neueste Version \(Stand 21.9.2017: OpenRefine 2.7\) für das Betriebssystem Linux. Die Installationsanleitung auf der Webseite ist simpel: "Download, extract, then type ./refine to start."

Wir erledigen dies wieder mit der Kommandozeile \(MATE-Terminal\):

* Download: 
  `wget https://github.com/OpenRefine/OpenRefine/releases/download/2.7/openrefine-linux-2.7.tar.gz`
* Extract \(entpacken\): 
  `tar -xzf openrefine-linux-2.7.tar.gz`

Im Ordner `openrefine-2.7` finden Sie jetzt das Programm OpenRefine.

## OpenRefine starten {#openrefine-starten}

```
~/openrefine-2.7/refine

```

Die Tilde \(`~`\) ist ein Kürzel für ihr Benutzerverzeichnis. Dieser Befehl funktioniert immer, egal in welchem Verzeichnis Sie sich gerade befinden. Wenn Sie sich im Ordner von OpenRefine befinden \(`cd ~/openrefine-2.7`\) reicht ein simples `refine`

Ist der Startvorgang erfolgreich, dann öffnet sich der Browser \(Firefox\) automatisch und Sie bekommen das Programm direkt angezeigt. OpenRefine ist in der Standardeinstellung unter der IP-Adresse [http://127.0.0.1:3333](http://127.0.0.1:3333) erreichbar.

## Übung: Daten aus Kapitel 1.5 in OpenRefine laden

Hinweis: Im Menüpunkt "Create Project" auf den Button "Durchsuchen" klicken und eine der in Kapitel 1.5 gespeicherten XML Dateien auswählen. Im nächsten Bildschirm unten links bei Parse data as "XML files" auswählen, dann im Vorschaubildschirm auf den Pfad ... klicken und dann oben rechts den Button "Create Project" drücken.

