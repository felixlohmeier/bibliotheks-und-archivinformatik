# Repository-Software DSpace-CRIS

## Nachträge zu Themen aus den Lerntagebüchern

Zu Tag 5 (13.11., Solr, Primo, VuFind, ...):
* Was macht das Programm `curl`? Warum wird es in Tutorials von bekannter Software (z.B. Apache Solr) oft als Beispiel verwendet?

  * Das Programm lädt Dateien (und Webseiten) aus dem Netzwerk/Internet. Es ist hilfreich, um Daten herunterzuladen oder mit Unix Tools auf der Kommandozeile direkt weiterzuverarbeiten.

* Zum Solr Tutorial:
  * Was ist ein two-node-cluster?
  * Was machen die folgenden beiden Befehle (und wo ist der Unterschied?)?
    > bin/post -c films example/films/films.json
    > C:\solr-8.2.0> java -jar -Dc=films -Dauto example\exampledocs\post.jar example\films\*.json
  * Was bedeutet das voreingestellte `*:*` im Query-Feld in der Administrationsoberfläche?

* Was ist das "Back Office" von Primo?

  * "The Primo Back Office is where all configurations to the Primo Front End and the rest of the system are made." (vgl. https://knowledge.exlibrisgroup.com/Primo/Training/Primo_Training/Primo_Certification/01_Primo_Back_Office_Overview)
  * Begriffe werden unterschiedlich verwendet, siehe beispielsweise das Content-Management-System TYPO3: https://docs.typo3.org/m/typo3/tutorial-getting-started/master/en-us/GeneralPrinciples/BackendAndFrontend/Index.html

* Screenshots (Bildschirmfoto) in VirtualBox erstellen
  * Menü: View (Anzeige) > Take Screenshot
  * Tastaturkürzel: Host-Taste (in der Standardeinstellung STRG bzw. CTRL rechts) + E
  * Falls Sie im Vollbildmodus arbeiten, ist das Menü unten in der Mitte erreichbar

Informationsquellen für aktuelle Entwicklungen im Bibliotheks- und Archivwesen:
* Zeitschriften: Welche kennen Sie?
* Präsentationen auf Konferenzen: Diese Woche gleich zwei spannende Konferenzen:
  * SWIB19 http://swib.org/swib19/programme.html
    * Heute Vortrag der SWIB19 per Livestream anschauen? 10:40 - 11:05 gibt es einen Vortrag "Data modeling in and beyond BIBFRAME"
  * Europeana 2019 https://pro.europeana.eu/page/europeana-2019
* Social Media: Insbesondere Twitter (und neu: Mastodon), ggf. mit Zusatztools wie Nuzzle http://nuzzel.com
* Blogs: Siehe "Blogroll" unter https://plan3t.info/
  * Übrigens: https://www.aubib.de veröffentlicht auch gerne Gastbeiträge (gestartet als Projekt von Studierenden des Bachelorstudiengangs Bibliotheks- und Informationsmanagement am Fachbereich Archiv- und Bibliothekswesen der Hochschule für den öffentlichen Dienst in Bayern)

## Repository-Software für Publikationen und Forschungsdaten (+ Forschungsinformationssysteme)

* Publikationen
  * Open Access
  * Statistik zu Open-Access-Repositorien: https://v2.sherpa.ac.uk/view/repository_visualisations/1.html
  * Fokus: Zweitveröffentlichungen ("grüner Weg") und Hochschulschriften
* Forschungsdaten
  * Open Data
  * Verzeichnis von Forschungsdaten-Repositorien: https://www.re3data.org
  * Fokus: Primärdaten, die bei der Forschung entstehen. Oft Daten als Anhang zu Zeitschriftenartikeln.
* Forschungsinformationen
  * Informationen über Forschende, Drittmittelprojekte, Patente usw.
  * Ziel ist die Forschungsberichterstattung. Um die Daten zusammenzuführen und Berichte erstellen zu können, werden oft Forschungsinformationssysteme an den Universitäten eingeführt.
  * Beispiel "Kerndatensatz Forschung" in Deutschland: https://kerndatensatz-forschung.de/version1/technisches_datenmodell/ER-Modell.html
  * Zum Stand in der Schweiz: Ackermann Krzemnicki, Sonia and Hägele, Bernd F. (2016): Die Standardisierung von Forschungsinformationen an Schweizer universitären Hochschulen. https://edoc.unibas.ch/54788/
* Beispiele
  * Zenodo https://zenodo.org
  * TUHH Open Research https://tore.tuhh.de
* DSpace-CRIS
  * Öffentliche Demo-Installation von DSpace-CRIS (DSpace inkl. Modul für Forschungsinformationen): https://test.dspace-cris.4science.it