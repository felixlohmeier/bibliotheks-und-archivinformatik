# Skript zum Kurs "Bibliotheks- und Archivinformatik"

Dieses Skript entsteht in der Zeit von September 2021 bis Januar 2022 im Rahmen der folgenden Lehrveranstaltung:

- Kurs "Bibliotheks- und Archivinformatik" (BAIN)
- Dozenten: [Felix Lohmeier](http://felixlohmeier.de), [Sebastian Meyer](https://twitter.com/_meyse_/)
- Herbstsemester 2021
- Lehrauftrag an der [FH Graubünden - Studiengang Information Science](https://www.fhgr.ch/studium/bachelorangebot/wirtschaft-und-dienstleistung/information-science/)
- Bachelor, 4 ECTS

## Gemeinsames Dokument

Für Notizen und zum Austausch verwenden wir ein gemeinsames Dokument in einer [HedgeDoc](https://github.com/hedgedoc/hedgedoc)-Installation [bei der GWDG](https://pad.gwdg.de/). Alle, die den Link kennen, können es bearbeiten. Zur Formatierung wird [Markdown](https://www.markdownguide.org/basic-syntax/) verwendet.

* [Gemeinsames Dokument für die Gruppe ISc18tzZ (Zürich)](https://pad.gwdg.de/TI2mEmrgSbuQOP7nJsfoXg?both)
* [Gemeinsames Dokument für die Gruppe ISc19vz (Chur)](https://pad.gwdg.de/70W-kLf9T0iW-rGHvTq7tg?both)

## Inhalte

1. [Technische Grundlagen](01_technische-grundlagen.md) (Chur: 16.09.2021, Zürich: 15.09.2021)
   - Schaubild zu Lehrinhalten
   - Einrichtung der Arbeitsumgebung (Linux)
   - Grundlagen der Unix Shell
   - Versionskontrolle mit git
   - Blog mit GitHub Pages
2. [Funktion und Aufbau von Bibliothekssystemen](02_funktion-und-aufbau-von-bibliothekssystemen.md) (Chur: 30.09.2021 und 07.10.2021, Zürich: 01.10.2021 und 08.10.2021)
   - Metadatenstandards in Bibliotheken (MARC21)
   - Installation und Konfiguration von Koha
   - Cloud-Konzepte am Beispiel von ALMA
   - Marktüberblick Bibliothekssysteme
3. [Funktion und Aufbau von Archivsystemen](03_funktion-und-aufbau-von-archivsystemen.md) (Chur: 23.10.2021, Zürich: 20.10.2021)
   - Metadatenstandards in Archiven (ISAD(G) und EAD)
   - Installation und Konfiguration von ArchivesSpace
   - Marktüberblick Archivsysteme
4. [Repository-Software für Publikationen und Forschungsdaten](04_repository-software-fuer-publikationen-und-forschungsdaten.md) (Chur: 04.11.2021, Zürich: 05.11.2021)
   - Open Access und Open Data
   - Übungen mit DSpace
   - Marktüberblick Repository-Software
5. [Metadaten modellieren und Schnittstellen nutzen](05_metadaten-modellieren-und-schnittstellen-nutzen.md) (Chur: 18.11.2021 und 02.12.2021, Zürich: 19.11.2021 und 03.12.2021)
   - Austauschprotokolle für Metadaten (OAI-PMH, SRU)
   - Metadaten über OAI-PMH harvesten mit VuFindHarvest
   - XSLT Crosswalks mit MarcEdit
   - Transformation von Metadaten mit OpenRefine
   - Weitere Tools zur Metadatentransformation
   - Nutzung von JSON-APIs
6. [Suchmaschinen und Discovery-Systeme](06_suchmaschinen-und-discovery-systeme.md) (Chur: 16.12.2021, Zürich: 17.12.2021)
   - Installation und Konfiguration von VuFind
   - Funktion von Suchmaschinen am Beispiel von Solr
   - Übung zur Datenintegration
   - Marktüberblick Discovery-Systeme
   - Zwischenfazit
7. [Linked Data](07_linked-data.md) (Chur: 13.01.2022, Zürich: 14.01.2022)
   - Ergebnis der Unterrichtsevaluation
   - Aktuelle Datenmodelle für Metadaten (BIBFRAME, RiC)
   - Praxisberichte
   - Metadaten anreichern mit OpenRefine und Wikidata
   - Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service
   - Empfehlenswerte Tutorials zum Selbstlernen

## Lerntagebücher

Als Prüfungsleistung schreiben Studierende Blogs, in denen sie von ihren Erkenntnissen berichten und sich mit den Inhalten des Seminars auseinandersetzen.

* [Jannik Christen](https://tonytestimony.github.io/Lerntagebuch-BAIN/)
* [Martin Heeb](https://marhee48.github.io/Lerntagebuch-BAIN/)
* [Anna Hilgert](https://hilgeann.github.io/Lerntagebuch_BAIN/)
* [Jacqueline Küng](https://schaglin.github.io/Mein-Lerntagebuch/)
* [Jahn Sievers](https://jahnsievers.github.io/Lerntagebuch-BAIN/)
* [Simon Mettler](https://simon-mettler.github.io/lernblog-bain/)
* [Joy Walser](https://joyrw.github.io/Lerntagebuch/)
* [Julia Zingg](https://jzingg.github.io/LerntagebuchBAIN_HS21/)
* [Talita Fisch] (https://github.com/TTly1/bain_gamora.git)


## Modulbeschreibung

Im Modul Bibliotheks- und Archivinformatik lernen die Studierenden die in Bibliotheken und Archiven eingesetzten Softwares und Technologien kennen. Funktionsweisen von Bibliothekskatalogen (bis hin zu Cloud-Konzepten), von Publikationsplattformen, Repositories etc. werden erläutert. Verschiedene Suchtechnologien werden analysiert und im Einsatz über unterschiedliche Datenbestände angewandt. Es wird gezeigt, wie Metadatenstandards und Austauschprotokolle eingesetzt und genutzt werden.

Nach erfolgreicher Teilnahme am Modul sind die Studierenden in der Lage:

* die Funktionsweise spezifischer Bibliothekssoftware zu verstehen
* die richtige Software für eine spezifische Aufgabe zu evaluieren
* Suchmaschinen zu konfigurieren
* Bibliothekarische und archivarische Metadaten (z.B. MARC, MARCXML, MODS, Dublin Core, EAD, BIBFRAME) zu modellieren und diese mit entsprechenden Protokollen / Anwendungen zu übertragen
* Crosswalks zwischen unterschiedlichen Metadatenformaten zu programmieren

## Skripte der Vorjahre

Herbstsemester 2021:

* Zenodo: [10.5281/zenodo.4386963](https://doi.org/10.5281/zenodo.4386963)
* GitHub: [v4.0](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/releases/tag/v4.0)

Frühlingssemester 2020:

* Zenodo: [10.5281/zenodo.3885498](https://doi.org/10.5281/zenodo.3885498)
* GitHub: [v3.0](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/releases/tag/v3.0)

Herbstsemester 2019:

* Zenodo: [10.5281/zenodo.3701841](https://doi.org/10.5281/zenodo.3701841)
* GitHub: [v2.0](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/releases/tag/v2.0)

Herbstsemester 2017:

* Zenodo: [10.5281/zenodo.3383051](https://doi.org/10.5281/zenodo.3383051)
* GitHub: [v1.0](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/releases/tag/v1.0)

## Lizenz

Dieses Werk ist lizenziert unter einer [Creative Commons Namensnennung 4.0 International Lizenz](http://creativecommons.org/licenses/by/4.0/)

[![Creative Commons Lizenzvertrag](images/cc-by-88x31.png)](http://creativecommons.org/licenses/by/4.0/)
