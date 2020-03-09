# Installation und Grundlagen

## Vorstellungsrunde und Organisatorisches

Die Studierenden haben in der Vorstellungsrunde folgende Motivation bzw. Erwartungshaltung genannt:

* Mehr über Bibliotheks- und Archivsysteme zu wissen
* Systeme evaluieren zu können in bibliotheks- und archivspezifischen Projekten
* Aufbau der Systeme kennenzulernen
* Wissen, wie man selber ein System entwickeln könnte (z.B. Dokumentenablage)
* Übertragen der Informatikkenntnisse auf andere Informationsbranchen ("nicht nur Bibliothek")
* Sicherheit bei diesem Thema erhalten
* Tools anzuwenden

## Einführung in Markdown (und CodiMD)

### Markdown 

* Von Aaron Swartz und John Gruber entwickelte Auszeichnungssprache für das Web.
* Ziel war ein Dateiformat, das für Menschen ebenso wie für Maschinen lesbar ist.
* Es ist ein "Plain Text"-Dateiformat, das mit wenigen Steuerzeichen (z.B. `#` für Überschriften oder `*` für Aufzählungen) arbeitet.
* Markdown lässt sich gut in andere Dateiformate (HTML, PDF, DOCX, EPUB, ...) konvertieren und wird in vielen Online-Tools verwendet.
* Mehr Infos bei Wikipedia: https://de.wikipedia.org/wiki/Markdown
* Dokumentarfilm zu Aaron Swartz:
  * Eintrag in der IMDB: https://www.imdb.com/title/tt3268458/
  * Vollständiger Film auf deutsch: https://www.youtube.com/watch?v=dJl1vVbK49Q
  * Vollständiger Film auf englisch: https://www.youtube.com/watch?v=3Q6Fzbgs_Lg
* Markdown CheatSheet: https://www.markdownguide.org/cheat-sheet/ (mit Basis Syntax und Erweiterung)
* Empfehlung für Markdown-Editor: [Typora](https://typora.io)
* Empfehlung für Dokumentenkonvertierung: [Pandoc](https://pandoc.org)

### CodiMD 

* Basiert auf dem Markdown-Standard
* Ermöglicht gleichzeitige Bearbeitung von Texten (wie bei Google Docs)
* Mehr Infos in folgenden Präsentationen:
  * Reader: https://felixlohmeier.de/slides/2019-06-13_oercamp-reader.html
  * Slides: https://felixlohmeier.de/slides/2019-06-13_oercamp-slides.html
* CodiMD-Installation ohne Registrierung zum Ausprobieren zum Beispiel unter https://hackmd.okfn.de (heißt dort noch HackMD)
  * Dokument erstellen oben rechts über Button `Neue Gast Notiz`
  * Direktlink für neues Dokument: https://hackmd.okfn.de/new

### Markdown Tutorial

Bitte bearbeiten Sie das folgende Online-Tutorial, um Markdown besser kennenzulernen: https://www.markdowntutorial.com (englisch, Empfehlung für Übersetzungs-Tool: [DeepL](https://www.deepl.com/translator))

Fehlt Ihnen eine Funktion, die sie sonst (in Word oder ähnlich) benutzen? Hier die von den Studierenden genannten Punkte und einige Antworten:
* Abbildungsverzeichnis
* Inhaltsverzeichnis:
  * Nur mit Erweiterungen, z.B. mit Markdown-Editor Typora, der die händische Arbeit übernimmt. Manche Plattformen haben eigene Erweiterungen, hier bei CodiMD funktioniert `[TOC]`
* durchgestrichenen Text:
  * `~~text~~`
  * ~~text~~
* hochgestellter und tiefergestellter Text:
  * `x<sup>2</sup> x<sub>2</sub>`
  * x<sup>2</sup> x<sub>2</sub>
* farbiger Text: eigentlich nicht im Sinne von Markdown, aber mit HTML-Code möglich:
  * `<span style="color:blue">some *blue* text</span>`
  * <span style="color:blue">some *blue* text</span>
* mehrere Spalten, Rahmen und Tabellen: Tabellen sind nur mit Erweiterungen möglich, CodiMD unterstützt ein paar Formen, z.B. mit Senkrechtstrichen:
```
| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Text     | Text     | Text     |
```
| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Text     | Text     | Text     |

## Einführung in die Arbeitsumgebung JupyterLab

Wir nutzen eine vorkonfigurierte Arbeitsumgebung mit [Lubuntu 18.04 LTS](https://lubuntu.me/) und [JupyterLab](https://jupyterlab.readthedocs.io).

Zur Einführung: Mike Driscoll (2019-04-17): [Getting Started With JupyterLab](https://dzone.com/articles/getting-started-with-jupyterlab)

![virtualbox-jupyterlab](virtualbox-jupyterlab.png)

### Option 1: VirtualBox

Die Software [VirtualBox](https://www.virtualbox.org/) ermöglicht es Ihnen, verschiedene Arbeitsumgebungen auf Ihrem Computer zu installieren, ohne dass Ihr gewohntes Betriebssystem verändert wird. VirtualBox ist kostenfrei für Windows, macOS und Linux erhältlich.

Laden Sie VirtualBox von der Webseite herunter, installieren Sie das Programm und importieren Sie dann die folgende Virtual Appliance: [lubuntu-jupyter-bain.ova](https://drive.switch.ch/index.php/s/DI5qngSao8SOs9b) (2,4 GB)

* user: `bain`
* pass: `bain2019`

Anleitung für Lehrende: [VirtualBox Appliance erstellen](notes_virtualbox-appliance-erstellen.md)

### Option 2: Booten von USB-Stick

In einigen Fällen erfüllten die mitgebrachten Laptops nicht die Anforderungen (2 GB freier Arbeitsspeicher, 20 GB freier Festplattenspeicher, Unterstützung für Hardware-Virtualisierung VT-X oder AMD-V) für die bereitgestellte VirtualBox Appliance. Meist lässt sich dies durch eine Konfiguration (Festplatte aufräumen, Aktivierung VT-X / AMD-V in der UEFI-Firmware, Deinstallation von Windows-Feature Hyper-V) beheben.

Für die verbleibenden Fälle, in denen VirtualBox nicht verwendet werden kann, wurden bootfähige USB-Sticks bereitgestellt, auf denen die gleiche Arbeitsumgebung installiert ist wie in der VirtualBox Appliance.

Bei einigen Laptops lässt sich vor dem Windows-Startvorgang ein Boot-Manager aufrufen. Dazu ist je nach Hersteller eine andere Taste notwendig. Probieren Sie F8 oder F12. Falls das nicht funktioniert, dann versuchen Sie folgende weitere Tasten: Esc, Entf, F2, F9, F10, F11. Eventuell landen Sie dabei im BIOS, wo es ggf. auch eine Boot-Einstellung gibt.

Alternativ können Sie auch aus einem laufenden Windows von einem USB-Stick booten. Über **Einstellungen > Problembehandlung > Erweiterter Start** können Sie eine Funktion **Gerät verwenden** aufrufen, um vom USB-Stick zu booten.

Anleitung für Lehrende: [Bootfähige USB-Sticks erstellen](notes_bootfaehige-usb-sticks-erstellen.md)

## Einführung in Virtualisierungstechnologie

### Computer-Bestandteile

Wir schrauben einen Laptop auf und finden darin:

- Prozessor (CPU)
- Arbeitsspeicher (RAM)
- Festplatte (HDD)
- Grafikkarte mit HDMI-Anschluss
- Soundkarte mit Kopfhörerbuchse
- Netzwerkkarte mit Netzwerkanschluss
- USB-Anschlüsse
- Mainboard
- ...

### Virtualisierung

![Ansatz der Systemvirtualisierung](https://upload.wikimedia.org/wikipedia/commons/f/f2/Ansatz_der_Systemvirtualisierung_zur_Schaffung_virtueller_Betriebsumgebungen.png)

Abbildung: Daniel Hirschbach (2006), Diplomarbeit "Vergleich von Virtualisierungstechnologien", CC-BY 2.0 [via Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Ansatz_der_Systemvirtualisierung_zur_Schaffung_virtueller_Betriebsumgebungen.png)

Literaturempfehlung: Artikel Virtualisierung in "Elektronik Kompendium". https://www.elektronik-kompendium.de/sites/com/1101011.htm (abgerufen am 8.10.2019)

## Einführung in die Kommandozeile

Wir bearbeiten gemeinsam die Lernmaterialien von [Library Carpentry zur Unix Shell](https://librarycarpentry.org/lc-shell/):

1. Öffnen Sie die Datei `01-lc-shell.ipynb` in JupyterLab
2. Führen Sie die Zellen im Notebook aus (Play-Button), um die Beispieldaten für die Übung zu laden. Nachdem Sie alle Zellen ausgeführt haben, erscheint links ein neuer Ordner `shell-lesson`.
3. Jetzt haben Sie zwei Möglichkeiten:
    * Option 1: Geben Sie die Befehle direkt im Notebook unten ein.
    * Option 2: Starten Sie ein neues Terminal in JuypterLab über den Dialog `File` > `New` > `Terminal`. Ein paar der in den Übungen verwendeten Funktionen wie die Tab-Taste für Autovervollständigung, die Befehlshistorie mit Pfeiltasten und die Anzeige von Dateien (z.B. mit `less` und `nano`) funktionieren nur im Terminal, nicht im Notebook.
4. Wir bearbeiten gemeinsam die Kapitel 2 und 3 sowie einen Teil von Kapitel 5 (Kapitel 4 überspringen wir).
* Kapitel 2: https://librarycarpentry.org/lc-shell/02-navigating-the-filesystem/index.html
* Kapitel 3: https://librarycarpentry.org/lc-shell/03-working-with-files-and-folders/index.html
* Kapitel 5 (teilweise): https://librarycarpentry.org/lc-shell/05-counting-mining/index.html

### Aufgaben zu Kapitel 3

Aufgabe 1: Datei kopieren
* Kommando: `cp` (steht für copy)
* Wie erstellen Sie eine Kopie `gulliver-backup.txt` von der Datei `gulliver.txt`?

Aufgabe 2: Datei in Verzeichnis verschieben
* Kommando: `mv` (steht für move)
* Erstellen Sie ein neues Unterverzeichnis `backup`
* Versuchen Sie die Datei `gulliver-backup.txt` in das Unterverzeichnis `backup` zu verschieben.

Aufgabe 3: Datei löschen
* Kommando: `rm` (steht für remove)
* Löschen Sie die Datei `gulliver-backup.txt`

Aufgabe 4: Verzeichnis löschen
* Hinweis: Zum Löschen von Verzeichnissen benötigen Sie den zusätzlichen Parameter `-r` (steht für rekursiv)
* Löschen Sie das Verzeichnis `backup`

### Aufgaben zu Kapitel 5

Aufgabe 1: Wie können Sie alle Spaltennamen in der Datei `2014-01_JA.tsv` ermitteln?

Aufgabe 2: Wieviele Zeilen haben jeweils die vier Dateien mit der Endung `.tsv`
* Hinweis: Nutzen Sie das Kommando `wc` (steht für word count)

Aufgabe 3: Versuchen Sie herauszufinden, welche der folgenden Reiseorte in Gulliver's Travels am häufigsten vorkommen:

* Hinweis: Nutzen Sie das Kommando `grep` mit dem Parameter `-c` (steht für count)

### Anwendungsfälle für Shell-Scripte

- Aus Library Carpentry Lesson: Kapitel 5 [Counting and mining](https://librarycarpentry.org/lc-shell/05-counting-mining/index.html) (hatten wir nur teilweise bearbeitet) und Kapitel 6 [Working with free text](https://librarycarpentry.org/lc-shell/06-free-text/index.html)
- Einige Beispiele aus der "Wildnis":
  - Extract EXIF Metadata and Output to a Text File: https://saaers.wordpress.com/2018/08/23/bash-how-to-extract-exif-metadata-and-output-to-a-text-file/
  - Mit Mono, Marcedit und Bash MARCXML in USMARC wandeln https://www.mactopics.de/2016/03/05/mit-mono-marcedit-und-bash-marcxml-in-usmarc-wandeln/
  - Bash Scripting: automating repetitive command line tasks (hier geht es um Langzeitarchivierung) https://acrl.ala.org/techconnect/post/bash-scripting-automating-repetitive-command-line-tasks/
- Basis, um weitere Tools verwenden zu können (Beispiel [ELAG2019 bootcamps](https://www.elag2019.de/bootcamps.html): "Participants should be familiar with command line interfaces (CLI)")