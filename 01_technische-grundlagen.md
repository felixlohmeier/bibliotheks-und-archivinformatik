# Technische Grundlagen

* Einrichtung der Arbeitsumgebung (Linux)
* Grundlagen der Unix Shell
* Versionskontrolle mit Git

Note:
- Den heutigen Tag werden wir vor allem mit allgemeinen technischen Grundlagen verbringen.
- Als Arbeitsumgebung verwenden wir ein Linux-Betriebssystem auf einer virtuellen Maschine. Im [vorigen Semester](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/releases/tag/v1.0) wurden im Kurs BAIN die virtuellen Maschinen lokal auf den Laptops der Studierenden mit [VirtualBox](https://www.virtualbox.org) installiert. Dabei treten aber in 1-2 von 10 Fällen Probleme in Verbindung mit BIOS/UEFI-Einstellungen, Sicherheitsfeatures und teilweise vorinstallierten Windows-Services (Hyper-V) auf.
- Die Unix Shell werden wir im Kurs öfter für Installation und Konfiguration der Software verwenden. Daher beginnen wir hier mit einer Wiederholung der wichtigsten Kommandos, damit uns das später leichter fällt.
- Durch die Plattform GitHub, auf der Informatiker\*innen Ihren Quellcode ablegen, ist das Versionskontrollsystem Git sehr populär geworden. Es ist nicht nur für die Entwicklung von Software, sondern generell für die Zusammenarbeit in Projekten extrem hilfreich.
- Die Übungen zu Unix Shell und Git basieren auf den Lehrmaterialien von [Library Carpentry](https://librarycarpentry.org/). Wer von Ihnen hat davon schon einmal gehört? Ggf. Lessons auf der Webseite zeigen.

## Einrichtung der Arbeitsumgebung (Linux)

* Wir verwenden virtuelle Maschinen der Cloud-Plattform Microsoft Azure.
* Auf den virtuellen Maschinen ist das Linux-Betriebssystem [Ubuntu 19.10 Server](https://wiki.ubuntu.com/EoanErmine/ReleaseNotes) mit der Oberfläche [XFCE](https://www.xfce.org) installiert.
* Sie erhalten alle eine eigene virtuelle Maschine, die Sie auch "kaputtspielen" dürfen.

Note:
- Normalerweise werden Linux-Server aus Sicherheitsgründen ohne grafische Oberfläche administriert, also nur über die Kommandozeile. Wir verwenden hier XFCE (extra leichtgewichtig, es gibt hübschere Linux-Desktops...), um den Einstieg zu erleichtern.
- "Kaputtspielen" bedeutet, dass die virtuelle Maschine einfach von mir auf den Ausgangszustand zurückgesetzt werden kann, wenn etwas schief geht. Scheuen Sie sich also nicht davor etwas auszuprobieren.
- Ausschlaggebende Gründe für Verwendung von [Microsoft Azure Lab Services](https://azure.microsoft.com/de-de/services/lab-services/) gegenüber anderen Plattformen:
  - Studierende müssen nur wenig Daten preisgeben (Microsoft-Konto, aber keine Zahlungsdaten)
  - Studierende können virtuelle Maschinen über eine einfach gehaltene Oberfläche selbst starten und stoppen.
  - Kosten entstehen nur für tatsächlich genutzte Zeit und nicht im ausgeschalteten Zustand.
- Anleitung für Lehrende: [Azure Lab einrichten](https://bain.felixlohmeier.de/#/azure-lab-einrichten)

### Registrierung im Lab

* Sie erhalten jetzt einen Registrierungslink an Ihre E-Mail-Adresse.
* Nach Login unter <https://labs.azure.com> sollte es so ähnlich aussehen:
  ![Screenshot Azure Lab Services - Meine virtuellen Computer](https://bain.felixlohmeier.de/images/01_azure-vms.png)

Note:
- Memo für Lehrende: Jetzt in Azure Lab Services einloggen, alle VMs starten und Registrierungslinks versenden.
- Es ist erforderlich, dass Sie im Zuge der Registrierung ein persönliches Microsoft-Konto einrichten oder ihre E-Mail-Adresse mit einem vorhandenen persönlichen Microsoft-Konto verbinden. Das lässt sich leider nicht vermeiden. Es müssen dabei E-Mail, Name und Geburtsdatum angegeben werden.
- Falls Sie nach dem Login erneut auf der Startseite der Lab Services landen:
  * Abmelden
  * Browser schließen
  * Browser neu starten
  * Seite <https://labs.azure.com> aufrufen und erneut anmelden.

### Verbindung mit der VM

* Nachdem die Virtuelle Maschine (VM) gestartet wurde (2-3 Minuten), können Sie über das kleine Bildschirm-Symbol die Zugangsdaten für Remote Desktop (RDP) laden.
* Beim ersten Aufruf müssen Sie ein Passwort vergeben.
* RDP-Datei öffnen mit:
  * Windows: Remote Desktop (vorinstalliert)
  * macOS: [Microsoft Remote Desktop 10](https://apps.apple.com/de/app/microsoft-remote-desktop-10/id1295203466) (siehe auch [Anleitung von Microsoft für macOS](https://docs.microsoft.com/de-de/azure/lab-services/classroom-labs/how-to-use-classroom-lab#connect-to-a-vm-using-rdp-on-a-mac))
  * Linux: [Remmina](https://remmina.org/)

Note:
- Während der Unterrichtszeiten starte und stoppe ich die VMs zentral.
- Bei der Verbindung von Zuhause denken Sie bitte daran, die Maschine nach der Verwendung zu stoppen, damit keine unnötigen Kosten anfallen.
- Das Passwort können Sie über das Zusatzmenü (drei kleine Punkte) jederzeit neu setzen.

### Login (Linux)

![Screenshot Azure Lab Services - Meine virtuellen Computer](https://bain.felixlohmeier.de/images/01_login.png)

Note:
- Benutzername: `bain`
- Passwort: (haben Sie beim ersten Start festgelegt)

### Orientierung (Linux)

![Screenshot Ubuntu XFCE](https://bain.felixlohmeier.de/images/01_ubuntu_xfce.png)

Note:
- Ubuntu Server 19.10 mit XFCE
- Benötigte Programme unten im Dock:
  1. Terminal
  2. Dateimanager (ähnlich Windows Explorer)
  3. Firefox-Browser
  4. Texteditor "Mousepad" (ähnlich Windows Notepad)
- Herunterfahren über die Azure Labs Oberfläche unter <https://labs.azure.com> (ein `sudo poweroff` im Terminal reicht nicht aus)

## Grundlagen der Unix Shell

* Wird benötigt zur Administration von Servern
* Ist aber auch zur Automatisierung von kleineren Aufgaben beliebt (Shell-Scripte)
* Mit der Unix Shell lässt sich sogar "Text Mining" betreiben (dazu später eine kleine Übung)

### Download Materialien

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

Bitte bearbeiten Sie zur Auffrischung Ihrer Shell-Kenntnisse die Kapitel 2 und 3 der Library Carpentry Lesson:
* Kapitel 2: <https://librarycarpentry.org/lc-shell/02-navigating-the-filesystem/>
* Kapitel 3: <https://librarycarpentry.org/lc-shell/03-working-with-files-and-folders/>

### Tipps

* Nutzen Sie immer die Tab-Taste für die Autovervollständigung
* Seien Sie faul, verwenden Sie Ihre persönliche Befehlshistorie (Pfeiltaste nach oben / Suche in der Historie mit `STRG`+`R`)
* Wichtig ist die Unterscheidung zwischen Programm (`ls`) und Parametern (`-l`).
* Nutzen Sie Spickzettel für die wichtigsten Kommandos wie z.B. [Library Carpentry Reference](https://librarycarpentry.org/lc-shell/reference.html) oder [Cheatsheet für Shell-Scripte](https://devhints.io/bash)

Note:
- Alle Programme in der Unix Shell sind ähnlich aufgebaut. Wenn Sie das Grundprinzip mit der Unterscheidung von Programm und Parametern verinnerlicht haben, dann hilft Ihnen auch die integrierte Hilfe (`--help`) weiter.

### Redirects und Pipes

![Library Carpentry Illustration Redirects and Pipes](https://librarycarpentry.org/lc-shell/fig/redirects-and-pipes.png)

Note:
1. Bei einer normalen Eingabe landet das Ergebnis im Terminal. `wc` steht für "word count" und liefert mit dem Parameter `-l` die Anzahl der Zeilen. Die Angabe `*.tsv` bedeutet alle Dateien mit der Dateiendung "tsv".
2. Stattdessen kann das Ergebnis aber auch in eine Datei umgelenkt werden mit der spitzen Klammer `>`
3. Das Ergebnis eines Programms kann mit "Pipes" (`|`) direkt weiterverarbeitet werden. Welche Ausgabe erwarten Sie?

## Versionskontrolle mit Git

* Aus Zeitgründen schauen wir uns nur kurz gemeinsam einige Grundfunktionen von `git` an.
* Wenn Sie im Anschluss selbst üben möchten, bietet Library Carpentry dazu [ausführliche Lehrmaterialien](<https://librarycarpentry.org/lc-git/>)

### Wozu Git?

* Git ist eine Software zur Versionskontrolle
* Ermöglicht die Arbeit an Textdateien auf mehreren Computern und/oder mit mehreren Personen zu synchronisieren.
* Jede Änderung wird nachvollziehbar.
* Funktioniert mit allen Textdateien, also geeignet für Code, Plain Text oder auch Tabellen (CSV).

Note:
* Git wurde entwickelt für die gemeinsame Software-Entwicklung; heute gibt es weitere Anwendungsfälle (z.B. Texte, Präsentationen oder Forschungsdaten).

### Unterschied Git und GitHub

* Git kann zunächst auch lokal auf einem Computer verwendet werden.
* Wenn ein Git Repository im Netz bereitgestellt werden soll, braucht es eine Installation von git auf einem Webserver.
* Das kann man selber machen oder eine Plattform nutzen. Die bekannteste ist [GitHub](https://www.github.com).

Note:
- GitHub ist ein 2007 gegründetes Unternehmen, das 2018 aufgekauft wurde. Die meisten Dienstleistungen sind kostenfrei, aber das muss nicht unbedingt so bleiben. Es ist so erfolgreich, dass praktisch jedes Open-Source-Projekt dort seinen Code ablegt.
- Alternativen zu GitHub sind unter anderem [GitLab](https://gitlab.com), [BitBucket](https://bitbucket.org) oder auch das Urgestein [SourceForge](https://sourceforge.net).
- Viele Bibliotheken nutzen GitHub oder GitLab. Es gibt eine gemeinschaftlich gepflegte Liste [BibsOnGitHub](https://github.com/axel-klinger/BibsOnGitHub), auf der [Listen von Bibliotheken](https://axel-klinger.github.io/BibsOnGitHub/libraries.html) und [deren Repositorien](https://axel-klinger.github.io/BibsOnGitHub/repositories.html) eingesehen werden können.

### Vorführung Grundfunktionen

* Als Beispiel nutzen wir das GitHub Repository für diesen Kurs, in dem die Lehrmaterialien liegen: <https://github.com/felixlohmeier/bibliotheks-und-archivinformatik>
* Zur Vorführung machen wir jetzt Folgendes:
  1. Die Dateien aus dem GitHub Repository herunterladen ("klonen")
  2. Eine der Textdateien verändern
  3. Die Änderung mit einer erläuternden Notiz hochladen

#### Repository klonen

```shell
git clone https://github.com/felixlohmeier/bibliotheks-und-archivinformatik.git
```

![Screenshot git clone](https://bain.felixlohmeier.de/images/01_git-demo_1.png)

#### Änderung mit Texteditor

```shell
cd bibliotheks-und-archivinformatik
nano 01_technische-grundlagen.md
```

![Screenshot nano](https://bain.felixlohmeier.de/images/01_git-demo_2.png)

Note:
* Beim Aufruf des Programms nano wird das Terminal zu einem Texteditor.
* Wir ergänzen eine Zeile in das leere Skript "Dies ist ein Test!"
* Speichern und Verlassen des Texteditors
  * `STRG`+`X`
  * `y` ("yes" zu "save modified buffer"?)
  * Dateiname bestätigen zum Überschreiben der Datei

#### Änderung anzeigen

```shell
git diff
```

![Screenshot git diff](https://bain.felixlohmeier.de/images/01_git-demo_3.png)

#### Lokaler Status

```shell
git status
```

![Screenshot git status](https://bain.felixlohmeier.de/images/01_git-demo_4.png)

#### Datei zum Päckchen hinzufügen

```shell
git add 01_technische-grundlagen.md
git status
```

![Screenshot git add](https://bain.felixlohmeier.de/images/01_git-demo_5.png)

#### Absender eintragen

```shell
git config user.email "mail@felixlohmeier.de"
git config user.name "Felix Lohmeier"
```

![Screenshot git config](https://bain.felixlohmeier.de/images/01_git-demo_6.png)

Note:
* Es werden Schreibrechte für das Git Repository benötigt, um Änderungen direkt einbringen zu können. Die Authentifizierung erfolgt über die E-Mail-Adresse.
* Falls man keine Schreibrechte hat, kann man aber eine Kopie (Fork) erstellen, darein schreiben und anschließend einen sogenannten "Pull Request" stellen. Die Besitzerin des ursprünglichen Repositorys erhält dann eine Benachrichtigung und kann die Änderung übernehmen oder ablehnen. Das üben wir zum nächsten Termin.

#### Packzettel beilegen und Päckchen schließen

```shell
git commit -m "Test Päckchen"
```

![Screenshot git commit](https://bain.felixlohmeier.de/images/01_git-demo_7.png)

#### Päckchen abschicken

```shell
git status
git push
```

![Screenshot git push](https://bain.felixlohmeier.de/images/01_git-demo_8.png)

#### Ergebnis auf GitHub

[Das Päckchen ("commit") bei GitHub](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/commit/caa6dc8dd640e0d1df86780288f84e0c47b81bef)

![Screenshot GitHub](https://bain.felixlohmeier.de/images/01_git-demo_9.png)

### Blog mit GitHub Pages

* Mit GitHub Pages lassen sich statische Webseiten direkt aus den Dateien im GitHub Repository generieren und auf Servern von GitHub kostenfrei veröffentlichen.
* GitHub verwendet dazu den (hauseigenen) Static-Site-Generator [Jekyll](https://help.github.com/en/github/working-with-github-pages/about-github-pages-and-jekyll).
  * Die Software nimmt Markdown- und HTML-Dateien und generiert daraus eine komplette Webseite.
  * Die Darstellung (Themes) lässt sich über eine Konfigurationsdatei einstellen.
* [Vorlage für ein Lerntagebuch mit GitHub Pages](https://github.com/felixlohmeier/lerntagebuch) (mit Schritt-für-Schritt-Anleitung)
* Siehe auch: [Interaktives Tutorial von GitHub](https://lab.github.com/githubtraining/github-pages)

### Übung: Pull Requests

**Aufgabe (10 Minuten):** Link zum Lerntagebuch im Skript ergänzen

1. Fork von Repository https://github.com/felixlohmeier/bibliotheks-und-archivinformatik erstellen ([Direktlink](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/fork ))
2. Datei `README.md` in Ihrem Fork bearbeiten und Link zu Ihrem Lerntagebuch in [Abschnitt "Lerntagebücher"](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/blob/master/README.md#lerntageb%C3%BCcher) ergänzen
3. Pull Request erstellen

Siehe auch: [Anleitung von GitHub](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork)

### Alternative zu GitHub: GitLab

* GitLab wird von einem kleinen Unternehmen entwickelt
* basiert ebenfalls auf der Software git
* Hat eine vergleichbare Funktion zu GitHub Pages: [GitLab Pages](https://docs.gitlab.com/ce/user/project/pages/)
* Kann auf einem eigenen Server installiert werden
* Vergleich von GitHub und GitLab: <https://www.heise.de/tipps-tricks/GitHub-vs-GitLab-4597154.html>
