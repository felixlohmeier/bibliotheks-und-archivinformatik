# Suchmaschinen und Discovery-Systeme

- Installation und Konfiguration von VuFind
- Funktion von Suchmaschinen am Beispiel von Solr
- Übung zur Datenintegration
- Marktüberblick Discovery-Systeme
- Zwischenfazit

## Installation und Konfiguration von VuFind

* VuFind Internetseite: <https://vufind.org>
* VuFind Code bei GitHub: <https://github.com/vufind-org/vufind>
* Deutsche VuFind Anwendergemeinschaft: <https://vufind.de>
* Präsentation “10 Jahre VuFind” (2017): <https://felixlohmeier.de/slides/2017-09-28_vufind-anwendertreffen-keynote.html>
* VuFind-Installationen weltweit: <https://vufind.org/wiki/community:installations>
  * Beispiel TU Hamburg: <https://katalog.tub.tuhh.de>
  * Beispiel UB Leipzig: <https://katalog.ub.uni-leipzig.de>

### Installation VuFind 7.0.1

Gemeinsame Installation nach offizieller Anleitung für VuFind unter Ubuntu: <https://vufind.org/wiki/installation:ubuntu>

Es folgen die relevanten Auszüge und Hinweise/Erklärungen dazu.

#### VuFind on Ubuntu

> These instructions assume that you are starting with a clean installation of Ubuntu. If you already have an Ubuntu server, you will be able to skip some steps, but you may have to reconfigure some existing software.

Zur Erinnerung: Best Practice ist die Installation von einer Anwendung pro Server (durch Virtualisierung und Container heute einfach möglich).

#### Version Requirements

> These instructions were most recently tested on Ubuntu 20.04 (...)

Gut für uns, weil wir für unsere virtuelle Maschine Ubuntu 20.04.1 LTS verwenden.

#### Installing VuFind from the DEB Package

> The easiest way to get VuFind up and running is to install it from the DEB package.

VuFind stellt ein Installationspaket bereit. Unter Linux gibt es viele verschiedene Formate für Installationspakete. Für Ubuntu und Debian gibt es DEB, für Fedora und SUSE beispielsweise RPM.

```shell
wget https://github.com/vufind-org/vufind/releases/download/v7.0.1/vufind_7.0.1.deb
sudo dpkg -i vufind_7.0.1.deb
sudo apt-get install -f
```

#### Bug in VuFind 7.0.1

* Die in VuFind 7.0.1 verwendete Version Solr 7.3.1 ist nicht mit der aktuellen Java-Version 11.0.9.1 unter Ubuntu 20.04 kompatibel.
* In der [VuFind-tech Mailingliste](https://sourceforge.net/p/vufind/mailman/message/37154029/) wurde daher empfohlen Java 8 zu verwenden oder auf Release 7.0.2 zu warten.
* Wir nutzen für unseren Test Java 8:

```shell
sudo apt install -y openjdk-8-jdk
```

* Danach aktivieren wir Java 8:

```shell
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo rm /usr/lib/jvm/default-java
sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64 /usr/lib/jvm/default-java
```

#### Important Notes / Database Issues

Hier ist ein Fehler in der Anleitung. Ubuntu 20.04 wird mit MariaDB ausgeliefert und nicht mit MySQL. Für uns ist daher "Case 4 - MariaDB" relevant.

#### MariaDB Passwort für root

> If you are using a distribution that includes MariaDB instead of MySQL, you will not be prompted to set a root password during installation. Instead, you should run “sudo /usr/bin/mysql_secure_installation” to properly set up security.

```shell
sudo /usr/bin/mysql_secure_installation
```

* Das aktuelle Passwort ist leer (Enter drücken).
* Neues Passwort vergeben (und merken!).
* Die voreingestellten Antworten sind OK (alle Fragen können mit Enter bestätigt werden).

#### MariaDB Zugriff auf root erlauben

> (...) you may also need to disable the root account's “unix_socket” plugin, which prevents regular logins. You can do this by logging in with “sudo mysql -uroot -p” and then running "UPDATE mysql.user SET plugin='' WHERE User='root'; FLUSH PRIVILEGES;"

1. Administration öffnen (und Passwort eingeben)
    ```
    sudo mysql -uroot -p
    ```
2. Konfigurationsbefehl eingeben
    ```
    UPDATE mysql.user SET plugin='' WHERE User='root'; FLUSH PRIVILEGES;
    ```
3. Administration schließen
    ```
    exit;
    ```

#### Important Notes / (Ende)

> You may want to restart your system one more time to be sure all the new settings are in place, or at least make sure appropriate environment variable settings are loaded by running: `source /etc/profile`

Ein Neustart ist in unserem Fall nicht erforderlich. Es reicht aus, den genannten Befehl einzugeben:

```shell
source /etc/profile
```

#### Abweichend von der Installationsanleitung: Dateirechte anpassen

* Wir starten Solr gleich "von Hand", d. h. mit den Rechten des Accounts, mit dem wir gerade an der VM angemeldet sind. Die VuFind-Installation sieht jedoch vor, mit den Rechten des ersten regulären Accounts gestartet zu werden.
* Wir übertragen diese Rechte also nun auf unseren Account und belassen die Rechte für das Cache- und das Config-Verzeichnis beim Account des Webservers (www-data).

```shell
sudo chown -R $USER:$GROUP /usr/local/vufind
sudo chown -R www-data:www-data /usr/local/vufind/local/cache
sudo chown -R www-data:www-data /usr/local/vufind/local/config
```

#### Configuring and starting VuFind / Start solr

```shell
cd /usr/local/vufind/
./solr.sh start
```

Die Warnungen zu den Limits können erstmal ignoriert werden. In der Doku von VuFind ist beschrieben, wie sich das korrigieren ließe: <https://vufind.org/wiki/administration:starting_and_stopping_solr>

#### Configuring and starting VuFind / Configure VuFind

> Open a web browser, and browse to this URL: <http://your-server-name/vufind/Install/Home> (Replace “your-server-name” with the address you wish to use to access VuFind; replace “vufind” with your custom base path if you changed the default setting during installation).

Wir haben keinen Domainnamen. Daher verwenden wir `localhost`. Öffnen Sie den Browser in der virtuellen Maschine (Linux) und rufen Sie die folgende Adresse auf:

<http://localhost/vufind/Install/Home>

#### Configuring and starting VuFind / Auto-Configuration

> If installation was successful, you should now see an Auto Configure screen. Some items on the list will be marked “Failed” with “Fix” links next to them. Click on each Fix link in turn and follow the on-screen instructions. (...) After an issue is successfully resolved, you can click the “Auto Configure” breadcrumb to go back to the main list and proceed to the next problem.

Die meisten Punkte können ohne weitere Angaben "gefixt" werden. Nur die beiden Punkte Database und ILS erfordern weitere Angaben.

#### Configuring and starting VuFind / Auto-Configuration / Database

Bei der Datenbank muss ein neues Passwort vergeben und das zuvor oben im Abschnitt "MariaDB Passwort für root" eingegeben werden.

#### Configuring and starting VuFind / Auto-Configuration / ILS

Wir haben kein Bibliothekssystem, daher wählen wir NoILS. Dann wird aber trotzdem noch "Failed" angezeigt und wenn wir nochmal auf "Fix" klicken erscheint die folgende Meldung:

> (...) You may need to edit the file at /usr/vufind/local/config/vufind/NoILS.ini

1. Datei im Texteditor (gedit) mit Administratorrechten öffnen

```shell
sudo gedit /usr/local/vufind/local/config/vufind/NoILS.ini
```

2. In Zeile 3 `ils-offline` in `ils-none` ändern und speichern.

#### Weitere Sicherheitseinstellungen

* Die in den Abschnitten [Locking Down Configurations](https://vufind.org/wiki/installation:ubuntu#locking_down_configurations) und [4. Secure your system](https://vufind.org/wiki/installation:ubuntu#secure_your_system) beschriebenen Einstellungen benötigen wir für unsere Testinstallation nicht.

#### Falls etwas schief geht...

* Wenn während der Installation etwas schief geht und die Seite "Auto Configuration" nicht mehr geladen werden kann, dann muss die lokale Konfiguration (im Verzeichnis /usr/local/vufind/local/) manuell gelöscht werden.

    ```shell
    sudo rm /usr/local/vufind/local/config/vufind/config.ini
    ```
* Danach ist die Seite "Auto Configuration" wieder aufrufbar.

### Testimport

* Ohne Inhalte lässt sich VuFind schlecht erproben. Daher laden wir zunächst ein paar Daten in das System.
* VuFind liefert für Tests einige Dateien mit. Wir laden einige davon im MARC21-Format.

    ```shell
    /usr/local/vufind/import-marc.sh /usr/local/vufind/tests/data/journals.mrc
    /usr/local/vufind/import-marc.sh /usr/local/vufind/tests/data/geo.mrc
    /usr/local/vufind/import-marc.sh /usr/local/vufind/tests/data/authoritybibs.mrc
    ```
* Anschließend sollten in der Suchoberfläche unter <http://localhost/vufind> ca. 250 Datensätze enthalten sein.

### Aufgabe: Konfiguration Suche und Facetten

* Schauen Sie sich dazu das offizielle Einführungsvideo [Configuring Search and Facet Settings](https://www.youtube.com/watch?v=qFbW8u9UQyM&list=PL5_8_wT3JpgE5rv38PwE2ulKlgzBY389y&index=4) an.
   * Ein Transkript ist auch auf der Seite <https://vufind.org/wiki/videos:configuring_search_and_facet_settings> verfügbar.
* Versuchen Sie ausgewählte Inhalte des Videos in Ihrer Installation nachzuvollziehen.

Note:

* Um die Bearbeitung der im Video benannten Konfigurationsdateien (.ini) zu erleichtern, können Sie die Dateiberechtigungen wie folgt ihrem Account zuordnen. Wir hatten diese für die Auto-Configuration beim Webserver (www-data) belassen.

```shell
sudo chown -R $USER:$GROUP /usr/local/vufind/local/config
```

## Funktion von Suchmaschinen am Beispiel von Solr

* Zur Einordnung von Solr
* Sichtung von Solr in VuFind

### Zur Einordnung von Solr

* Solr ist zusammen mit Elasticsearch quasi "Industriestandard".
* Üblicherweise sollte vor dem Import der Daten in einem Schema festgelegt werden welche Felder existieren und welche Datentypen diese beinhalten dürfen.
* Solr hat zwar eine integrierte Suchoberfläche, aber diese ist nur zu Demo-Zwecken gedacht.
* Das Discovery-System VuFind basiert auf Solr (ebenso wie viele kommerzielle Lösungen wie z.B. Ex Libris Primo).

### Suchindex (Solr) oder Datenbank (MySQL)?

| Solr                     | MySQL                   |
| ------------------------ | ----------------------- |
| flache Dokumente         | relationale Datensätze  |
| lexikalische Suche       | reiner Glyphenvergleich |
| keine Konsistenzprüfung  | Transaktionssicherheit  |
| statische Daten          | veränderliche Daten     |
| -> **Retrieval** (Suche) | -> **Storage** (CRUD)   |

* [CRUD](https://de.wikipedia.org/wiki/CRUD): **C**reate, **R**ead, **U**pdate, **D**elete

Ein weiterer [Antwortversuch bei Stackoverflow](https://stackoverflow.com/a/4961973)

### Sichtung von Solr in VuFind

* Administrationsoberfläche: <http://localhost:8983>
* Bibliografische Daten im Index "biblio": <http://localhost:8983/solr/#/biblio>
* Technische Suchoberfläche in Solr für Index "biblio": <http://localhost:8983/solr/#/biblio/query>
* Schema des Index "biblio": <http://localhost:8983/solr/#/biblio/schema>
  * Erläuterung der VuFind-Felder in VuFind Doku: <https://vufind.org/wiki/development:architecture:solr_index_schema>

### Übung: Suche in VuFind vs. Suche in Solr

* Suchen in VuFind: http://localhost/vufind
  * Beispielsweise nach `psychology`
* Suchen in Admin-Oberfläche von Solr: http://localhost:8983/solr/#/biblio/query
  * im Feld q mit Feldname:Suchbegriff. Beispiel: `allfields:psychology`
  * unten links Button "Execute Query"
* Parallel Logdatei von Solr anschauen in einem Terminal
    ```shell
    less +F /usr/local/vufind/solr/vufind/logs/solr.log
    ```
* Notieren Sie Unterschiede und Auffälligkeiten im gemeinsamen Dokument

### Literatur zu Solr

* Das offizielle Handbuch zu Solr beinhaltet ein gutes Tutorial (ca. 2 Stunden): <https://lucene.apache.org/solr/guide/8_7/solr-tutorial.html>

## Übung zur Datenintegration

Ziel: Import der mit MarcEdit und OpenRefine konvertierten Daten aus Koha, ArchivesSpace, DSpace und DOAJ in VuFind

### Testdaten löschen

Quelle: https://vufind.org/wiki/indexing:re-indexing

```shell
/usr/local/vufind/solr.sh stop
rm -rf /usr/local/vufind/solr/vufind/biblio/index /usr/local/vufind/solr/vufind/biblio/spell*
/usr/local/vufind/solr.sh start
```

### Aufgabe für die Gruppenarbeit

* Importieren Sie alle in MARCXML konvertierten Daten. Gehen Sie dabei wie folgt vor:
    1. Laden und entpacken Sie [die Beispieldaten](https://bain.felixlohmeier.de/data/vufind-testdaten.zip). Gerne können Sie zusätzlich Ihre selbst in MARCXML konvertierten Daten verwenden.
    2. Bearbeiten Sie vor dem Import die Datei `marc_local.properties` um den verschiedenen Datenquellen eine `collection` zuzuweisen.
        ```shell
        gedit /usr/local/vufind/import/marc_local.properties
        ```
    3. Starten Sie das Importscript für die erste Datenquelle. Beispiel:
        ```shell
        for f in ~/Downloads/vufind-testdaten/koha/*.xml; do /usr/local/vufind/import-marc.sh $f; done
        ```
    4. Wiederholen Sie die Schritte 2 und 3 für die übrigen Datenquellen.
* Achtung: Der Import der Beispieldaten von ArchivesSpace und DSpace schlägt fehl. Finden Sie die Ursache und versuchen Sie den Fehler zu beheben.
* Fügen Sie am Ende der Übung einen Screenshot der Trefferliste einer "leeren" Suche in das gemeinsame Dokument ein.

Note:
* Die Beispieldaten umfassen die in den vergangenen Lehreinheiten mit MarcEdit und OpenRefine prozessierten Daten sowie den Export aus Koha. Wir stellen Sie hier bereit, damit Sie einheitliche Daten zur Verfügung haben auch wenn bei den vorigen Aufgaben etwas durcheinandergekommen ist.

## Marktüberblick Discovery-Systeme

### International

* Jährlicher Library Systems Report von Marshall Breeding im ALA Magazine: <https://americanlibrariesmagazine.org/2020/05/01/2020-library-systems-report/>
* Anhängende Statistik gibt einen guten Überblick:
<https://americanlibrariesmagazine.org/wp-content/uploads/2020/04/charts-for-2020-Library-Systems-Report.pdf>

Note:
* Die Funktionalität eines Discovery-Systems besteht aus mindestens zwei Komponenten: Der Software und den Daten.
* Kommerzielle Discovery-Systeme verkaufen einen Suchindex meist separat, der vor allem Metadaten zu elektronischen Artikeln enthält.
* Offene Alternativen: [K10plus-Zentral](https://verbundwiki.gbv.de/display/VZG/K10plus-Zentral), [finc Artikelindex](https://finc.info/services)

### Schweiz: SLSP

* Durch [Swiss Library Service Platform](https://slsp.ch) wurde Ex Libris Alma und damit auch das dazu gehörige Discovery-System Primo VE an den wissenschaftlichen Bibliotheken in der Schweiz eingeführt.
* Am Mo, 7.12.2020 ist das neue Rechercheportal [swisscovery](https://swisscovery.slsp.ch) gestartet.

Note:
* Den Library Systems Report hatten wir uns an [Tag 3](https://pad.gwdg.de/hpRnEqJCTfuTrd-gbdmd2w?both#Statistiken-zum-Markt-USAUK) bereits angeschaut, damals jedoch mit Blick auf Bibliothekssysteme. Marshall Breeding führt in seinem Bericht aber auch Discovery-Systeme auf.

## Zwischenfazit

![Schaubild zu Lehrinhalten](images/05_schaubild-v3.png)

## Aufgaben

Bis zum nächsten Termin:

* Beitrag im Lerntagebuch zu dieser Lehreinheit
* Unterrichtsbeurteilung in Moodle
