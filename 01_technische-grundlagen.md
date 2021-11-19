# Technische Grundlagen

* Schaubild zu Lehrinhalten
* Einrichtung der Arbeitsumgebung (Linux)
* Grundlagen der Unix Shell
* Versionskontrolle mit git
* Blog mit GitHub Pages

![Schaubild zu Lehrinhalten](images/schaubild-lehrinhalte.png)

erstellt mit [mermaid](https://mermaidjs.github.io/mermaid-live-editor/)

Note:
- In diesem Schaubild sind links die Lokalsysteme (Bibliothekssytem Koha, Archivinformationssystem ArchivesSpace, Repository-Software DSpace) aufgeführt. Diese bieten jeweils eine OAI-Schnittstelle an.
- Mit einer speziellen Software (hier: VuFindHarvest) werden die Metadaten im jeweils spezifischen Format eingesammelt. Über einen XSLT Crosswalk werden die Daten dann einheitlich in MARC21-XML überführt. Zusätzlich werden Tabellendaten (CSV) mit OpenRefine ebenfalls in MARC21-XML transformiert.
- Abschließend werden alle MARC21-XML-Daten in die Discovery-Lösung VuFind eingespielt.
- Wir lernen die Systeme, Schnittstellen, Tools und Formate Schritt für Schritt kennen. Am Ende des Kurses sollten Sie das Schaubild dann in eigenen Worten erklären können.

## Einrichtung der Arbeitsumgebung (Linux)

### Arbeitsumgebung

* Jede/r erhält eine virtuelle Maschine der FH Graubünden mit Ubuntu Linux.
* Sie haben volle Administrationsrechte.
* Dozenten haben zur Unterstützung und Fehlerbehebung ebenfalls Zugriff darauf.

### Linux

* Die meisten Webserver laufen auf Linux.
* Wir verwenden [Ubuntu](https://ubuntu.com) in der Version 20.04 LTS.
* Ubuntu basiert wiederum auf [Debian](https://www.debian.org). Die ganze Familiengeschichte: [GNU/Linux Distributions Timeline](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg)

Note:
- Normalerweise werden Linux-Server aus Sicherheitsgründen ohne grafische Oberfläche administriert, also nur über die Kommandozeile.

### Zugriff auf die virtuelle Maschine

1. Mit dem Netzwerk der FHGR verbinden (ggf. via VPN)
2. <https://horizon.fhgr.ch> aufrufen
3. Zugriff auf die virtuelle Maschine (Ubuntu) entweder direkt über den Browser (HTML5) oder über eine Zusatzsoftware (Horizon Client)

Sie können sich an allen drei Punkten (VPN, Horizon und Ubuntu) mit Ihrem persönlichen FHGR-Konto anmelden. Achtung: Beim Anmeldebildschirm von Ubuntu ist ein US-Tastaturlayout eingestellt.

Note:
- Bei Wikimedia Commons gibt es ein Bild des US-Tastaturlayouts: <https://commons.wikimedia.org/wiki/File:KB_United_States.svg>
- Copy & Paste funktioniert zuverlässiger mit der Zusatzsoftware.

### Übung: Verbindung testen

Bitte verbinden Sie sich jetzt mit der virtuellen Maschine. Nach dem Login sollte es etwa so aussehen:

![Screenshot des Ubuntu-Desktops](images/ubuntu-startscreen.png)

### Grundeinstellungen

1. Favoriten
  * Unten links Anwendungsmenü öffnen
  * Programm suchen (`Terminal` und `Text Editor`)
  * Rechtsklick auf Icon und `Add to Favorites` wählen

2. Startseite im Firefox Browser
  * Die Übersichtsseite des gemeinsamen Dokuments aufrufen
  * Über das Sternchen in der Adressleiste ein Lesezeichen setzen

Note:
- Teilnehmer\*innen mit Mac? Dann im Applikationsmenü "Region & Language" das Keyboard Layout "German (Switzerland, Macintosh)" ergänzen und auswählen

## Grundlagen der Unix Shell

* Wird benötigt zur Administration von Servern
* Ist aber auch zur Automatisierung von kleineren Aufgaben beliebt (Shell-Scripte)

Note:
- Die Unix Shell werden wir im Kurs öfter für Installation und Konfiguration der Software verwenden. Daher beginnen wir hier mit einer Wiederholung der wichtigsten Kommandos, damit uns das später leichter fällt.
- Es gibt verschiedene Varianten der Shell. Ubuntu verwendet Bash.

### Download der Materialien

1. In das Home-Verzeichnis wechseln

    ```shell
    cd
    ```

2. Archiv shell-lesson.zip von Library Carpentry herunterladen

    ```shell
    wget https://librarycarpentry.org/lc-shell/data/shell-lesson.zip
    ```

3. Archiv in den Ordner shell-lesson entpacken und Archiv löschen

    ```shell
    unzip shell-lesson.zip -d shell-lesson
    rm shell-lesson.zip
    ```

### Übungen

Aufgaben:

1. Bearbeiten Sie das zweite Kapitel [Navigating the filesystem](https://librarycarpentry.org/lc-shell/02-navigating-the-filesystem/index.html) der Library Carpentry Lesson zur Unix Shell
2. Bearbeiten Sie das dritte Kapitel [Working with files and directories](https://librarycarpentry.org/lc-shell/03-working-with-files-and-folders/index.html) der Library Carpentry Lesson zur Unix Shell

### Tipps zur Unix Shell

* Copy & Paste im Terminal mit Rechtsklick oder STRG+SHIFT+C und STRG+SHIFT+V
* Nutzen Sie immer die Tab-Taste für die Autovervollständigung.
* Seien Sie faul, verwenden Sie Ihre persönliche Befehlshistorie (Pfeiltaste nach oben / Suche in der Historie mit `STRG`+`R`).
* Wichtig ist die Unterscheidung zwischen Programm (`ls`) und Parametern (`-l`).
* Nutzen Sie Spickzettel für die wichtigsten Kommandos wie z.B. [Library Carpentry Reference](https://librarycarpentry.org/lc-shell/reference.html) oder [Cheatsheet für Shell-Scripte](https://devhints.io/bash).

Note:
- Alle Programme in der Unix Shell sind ähnlich aufgebaut. Wenn Sie das Grundprinzip mit der Unterscheidung von Programm und Parametern verinnerlicht haben, dann hilft Ihnen auch die integrierte Hilfe (`--help`) weiter.
- Linux hat ein integriertes Nutzerhandbuch, das zu beinahe jedem Kommando und Programm hilfreiche Dokumentation enthält: man <command> (auch via Google)

### Redirects und Pipes

![Library Carpentry Illustration Redirects and Pipes](images/redirects-and-pipes.png)

Note:
1. Bei einer normalen Eingabe landet das Ergebnis im Terminal. `wc` steht für "word count" und liefert mit dem Parameter `-l` die Anzahl der Zeilen. Die Angabe `*.tsv` bedeutet alle Dateien mit der Dateiendung "tsv".
2. Stattdessen kann das Ergebnis aber auch in eine Datei umgelenkt werden mit der spitzen Klammer `>`
3. Das Ergebnis eines Programms kann mit "Pipes" (`|`) direkt weiterverarbeitet werden. Welche Ausgabe erwarten Sie?

## Versionskontrolle mit git

* Aus Zeitgründen schauen wir uns nur Grundfunktionen von `git` an.
* Wenn Sie im Anschluss selbst üben möchten, bietet Library Carpentry dazu [ausführliche Lehrmaterialien](<https://librarycarpentry.org/lc-git/>)

Note:
- Durch die Plattform GitHub, auf der Informatiker\*innen Ihren Quellcode ablegen, ist das Versionskontrollsystem Git sehr populär geworden. Es ist nicht nur für die Entwicklung von Software, sondern generell für die Zusammenarbeit in Projekten extrem hilfreich.

### Wozu Git?

* Git ist eine Software zur Versionskontrolle
* Ermöglicht die Arbeit an Textdateien auf mehreren Computern und/oder mit mehreren Personen zu synchronisieren.
* Jede Änderung wird nachvollziehbar.
* Funktioniert mit allen Textdateien, also geeignet für Code, Plain Text oder auch Tabellen (CSV).

Note:
* Git wurde entwickelt für die gemeinsame Software-Entwicklung; heute gibt es weitere Anwendungsfälle (z.B. Texte, Präsentationen oder Forschungsdaten).

### Unterschied Git und GitHub

* Git kann zunächst auch lokal auf einem Computer verwendet werden.
* Wenn ein Git Repository im Netz bereitgestellt werden soll, braucht es eine Installation von Git auf einem Webserver.
* Das kann man selber machen oder eine Plattform nutzen. Die bekannteste ist [GitHub](https://www.github.com).

Note:
- GitHub ist ein 2007 gegründetes Unternehmen, das 2018 aufgekauft wurde. Die meisten Dienstleistungen sind kostenfrei, aber das muss nicht unbedingt so bleiben. Es ist so erfolgreich, dass praktisch jedes Open-Source-Projekt dort seinen Code ablegt.
- Alternativen zu GitHub sind unter anderem [GitLab](https://gitlab.com), [BitBucket](https://bitbucket.org) oder auch das Urgestein [SourceForge](https://sourceforge.net).
- Viele Bibliotheken nutzen GitHub oder GitLab. Es gibt eine gemeinschaftlich gepflegte Liste [BibsOnGitHub](https://github.com/axel-klinger/BibsOnGitHub), auf der [Listen von Bibliotheken](https://axel-klinger.github.io/BibsOnGitHub/libraries.html) und [deren Repositorien](https://axel-klinger.github.io/BibsOnGitHub/repositories.html) eingesehen werden können.

### Programme installieren

1. Verzeichnis aktualisieren

    ```shell
    sudo apt update
    ```

2. Programme installieren

    ```shell
    sudo apt install git curl
    ```

Note:
- Darauf folgt eine Passwortabfrage (nochmal das gleiche)
- Änderungen werden komplex angezeigt, diese müssen dann nochmal mit `Y` (oder Enter) bestätigt werden
- Die Paketverwaltung unter Linux ist vergleichbar mit einem App-Store von Apple oder Google

### Übung: Link zum Lerntagebuch ergänzen

* Als Beispiel nutzen wir das [GitHub Repository dieses Kurses](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik), in dem die Lehrmaterialien liegen.
* Sie ergänzen darin den Link zu Ihrem Lerntagebuch.
* So gehen wir vor:
  1. Kopie des Repositories erstellen ("Fork")
  2. Dateien aus Ihrem Fork herunterladen ("clone")
  3. Link zu Ihrem Lerntagebuch in `README.md` einfügen
  4. Die Änderung mit einer Notiz hochladen ("commit")
  5. Übernahme der Änderung anfragen ("Pull request")

### Schritt 0: Git konfigurieren

Name und E-Mail für Git hinterlegen

```shell
git config --global user.name "Felix Lohmeier"
git config --global user.email "mail@felixlohmeier.de"
```

Note:
- Ersetzen Sie die Angaben durch Ihre eigenen und verwenden Sie dieselbe E-Mail-Adresse, mit der Sie sich bei GitHub registriert haben. Dadurch kann GitHub Ihnen alle Änderungen zuordnen.
- Die Konfiguration ist nur einmalig nötig. Sie wird in Ihrem Home-Verzeichnis gespeichert (```~/.gitconfig```) und künftig für jedes Repository automatisch als Standard verwendet.

#### Schritt 1: Kopie des Repositories erstellen

* Bei GitHub einloggen
* Repository aufrufen: <https://github.com/felixlohmeier/bibliotheks-und-archivinformatik>
* Oben rechts auf Button "Fork" klicken

#### Schritt 2: Dateien herunterladen

Um die Dateien aus Ihrem Fork herunterzuladen ("klonen") geben Sie den folgenden Befehl ins Terminal ein.

Ersetzen Sie dabei `...` durch den Link zu Ihrem Fork.

```shell
git clone ...
```

Wechseln Sie in das erstellte Verzeichnis.

```shell
cd bibliotheks-und-archivinformatik
```

#### Schritt 3: Änderung lokal durchführen

1. Datei `README.md` in Texteditor öffnen und Link zu Ihrem Lerntagebuch in Abschnitt "Lerntagebücher" einfügen.

2. Lassen Sie sich von `git` die Änderungen anzeigen:

    ```shell
    git diff
    ```

3. Lassen Sie sich von `git` die geänderten Dateien anzeigen:

    ```shell
    git status
    ```

#### Schritt 4: Änderung hochladen

1. Datei zum Päckchen hinzufügen

    ```shell
    git add README.md
    ```

2. Absender eintragen (mit Ihren Daten ersetzen)

    ```shell
    git config user.email "mail@felixlohmeier.de"
    git config user.name "Felix Lohmeier"
    ```

3. Packzettel beilegen und Päckchen schließen

    ```shell
    git commit -m "Link zu meinem Lerntagebuch"
    ```

4. Päckchen abschicken

    ```shell
    git push
    ```

#### Schritt 5: Pull Request erstellen

* Mit wenigen Sekunden Verzögerung sollte Ihre Änderung nun auch bei GitHub angekommen sein.
* Öffnen Sie Ihren Fork bei GitHub.
* Klicken Sie auf den Link "Pull request". Dann erscheint ein Vergleich. Klicken Sie dort auf den Button "Create pull request".
* Vervollständigen Sie das Formular und klicken Sie auf den Button "Create pull request".

#### Ergebnis auf GitHub

Sie finden Ihren Pull Request im ursprünglichen Repository bei GitHub im Tab "Pull requests": <https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/pulls>

### Wofür git in Bibliotheken und Archiven?

* Arbeitsfeld "forschungsnahe Dienste", siehe Positionspapier der Kommission für forschungsnahe Dienste des VDB: https://www.o-bib.de/article/view/5718/8434
* siehe auch "Uses in a library context" in [Library Carpentry Lesson zu git](https://librarycarpentry.org/lc-git/01-what-is-git/index.html): "Local library looking to start a crowdsourcing project" und "Multiple people editing metadata for a collection"

## Blog mit GitHub Pages

* Mit GitHub Pages lassen sich statische Webseiten direkt aus den Dateien im GitHub Repository generieren und auf Servern von GitHub kostenfrei veröffentlichen.
* GitHub verwendet dazu den (hauseigenen) Static-Site-Generator [Jekyll](https://help.github.com/en/github/working-with-github-pages/about-github-pages-and-jekyll).
  * Die Software nimmt Markdown- und HTML-Dateien und generiert daraus eine komplette Webseite.
  * Die Darstellung (Themes) lässt sich über eine Konfigurationsdatei einstellen.

## Aufgaben

Bis zum nächsten Termin:

1. Lerntagebuch einrichten
  * Vorlage für ein Lerntagebuch mit GitHub Pages: <https://github.com/felixlohmeier/lerntagebuch>
  * Link bitte auf der Übersichtsseite der gemeinsamen Dokumente ergänzen
2. Einführungsartikel (wo bin ich gestartet?)
3. Beitrag zu dieser Lehreinheit "Technische Grundlagen"
