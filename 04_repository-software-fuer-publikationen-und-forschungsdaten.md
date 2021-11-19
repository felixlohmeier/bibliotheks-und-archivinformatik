# Repository-Software für Publikationen und Forschungsdaten

* Open Access und Open Data
* Übungen mit DSpace
* Marktüberblick Repository-Software

## Open Access und Open Data

* Publikationen
  * Open Access
  * [Statistik zu Open-Access-Repositorien](https://v2.sherpa.ac.uk/view/repository_visualisations/1.html)
  * Fokus: Zweitveröffentlichungen ("grüner Weg") und Hochschulschriften
* Forschungsdaten
  * Open Data
  * [Verzeichnis von Forschungsdaten-Repositorien](https://www.re3data.org)
  * Fokus: Primärdaten, die bei der Forschung entstehen. Oft Daten als Anhang zu Zeitschriftenartikeln.

Note:
- Unterscheidung institutionelles Repositorium vs. Fachrepositorium

### Forschungsinformationen

* Informationen über Forschende, Drittmittelprojekte, Patente und vieles mehr.
* Ziel ist die Forschungsberichterstattung. Um die Daten zusammenzuführen und Berichte erstellen zu können, werden oft Forschungsinformationssysteme an den Universitäten eingeführt.
* Beispiel: ["Kerndatensatz Forschung" in Deutschland](https://kerndatensatz-forschung.de/version1/technisches_datenmodell/ER-Modell.html)
* Zum Stand in der Schweiz: Ackermann Krzemnicki, Sonia and Hägele, Bernd F. (2016): Die Standardisierung von Forschungsinformationen an Schweizer universitären Hochschulen. <https://edoc.unibas.ch/54788/>

### Beispiele

* [Zenodo](https://zenodo.org) (Invenio)
* [TUHH Open Research](https://tore.tuhh.de) (DSpace-CRIS)

## Übungen mit DSpace

### Einführung in DSpace

* Software geeignet für Publikationen und Forschungsdaten
* Erweiterung für Forschungsinformationen: DSpace-CRIS.
* Metadatenstandard: Qualified Dublin Core, kann aber auch mit [DataCite](https://schema.datacite.org/) Metadatenschema betrieben werden.
* DSpace 6.x: 2016 erstmalig veröffentlicht (aktuell 6.3), wird gepflegt, aber nicht mehr weiterentwickelt.
* DSpace 7.x: im August 2021 veröffentlicht (aktuell 7.1), neue Technologien im Frontend (Angular) und Backend (neue REST API), aber noch nicht voller Funktionsumfang von 6.x.

### DSpace Demo

Aus Zeitgründen keine Installation, nur Test mit öffentlich zugänglicher Demo.

DSpace 6.x Demo: <https://demo.dspace.org>

- Site Administrator: `dspacedemo+admin@gmail.com`
- Community Administrator: `dspacedemo+commadmin@gmail.com`
- Collection Administrator: `dspacedemo+colladmin@gmail.com`
- Submitter: `dspacedemo+submit@gmail.com`
- Passwort immer: `dspace`

Note:
- Sie können die XMLUI oder die JSPUI verwenden. Beide Oberflächen sind mit dem gleichen Backend verbunden.

### Übung: Communities und Collections

**Aufgabe (10 Minuten)**

* Aufgabe: Erstellen Sie eine Sub-Community der "Sample Community" und legen Sie darin eine Collection an.
  * Login: `dspacedemo+commadmin@gmail.com`
  * Passwort: `dspace`
  * Sample Community [in XML UI](https://demo.dspace.org/xmlui/handle/10673/1) und [in JSP UI](https://demo.dspace.org/jspui/handle/10673/1)
* Ziel: Dokumentieren Sie den Link zu Ihrer Collection unten im gemeinsamen Dokument.
* Hinweise:
  * Weisen Sie Rechte für den Account "Collection Administrator" zu
  * [Erläuterungen in der How-To von DSpaceDirect](https://wiki.lyrasis.org/display/DSpaceDirectKB/Getting+Started+How-To#GettingStartedHowTo-Communities&Collections)

Note:
- Der Grund, warum es zusätzlich zu Collections auch noch Communities gibt, ist das Rechtemanagement. In der Community wird festgelegt wer die (ggf. mehrere zugehörige) Collections verwalten darf. Das möchte man nur an einer Stelle und nicht an jeder Collection definieren. Außerdem können ganze Communities "geharvestet" werden, also Daten einer Einrichtung über die Schnittstellen abgefragt werden.

### Übung: Einreichung und Review

**Aufgabe (20 Minuten)**

* Aufgabe: Reichen Sie ein Beispieldokument für Ihre Collection ein. Starten Sie falls nötig den Begutachtungsprozess (falls beim Anlegen der Collection aktiviert) und veröffentlichen Sie das Dokument.
* Login: `dspacedemo+colladmin@gmail.com`
* Passwort: `dspace`
* Ziel: Dokumentieren Sie den Link zu Ihrer Veröffentlichung unten im gemeinsamen Dokument.
* Hinweis: [Erläuterungen in der How-To von DSpaceDirect](https://wiki.lyrasis.org/display/DSpaceDirectKB/Getting+Started+How-To#GettingStartedHowTo-Adding/SubmittingItems).

Note:
- Der Einreichungs- und Begutachtungsprozess in DSpace ist sehr umfangreich konfigurierbar. Alle Formulare können angepasst und vereinfacht werden.
- Der Hinweis von DSpaceDirect, dass das Geld kostet, bezieht sich auf deren Hosting. Wenn Sie DSpace selbst hosten, können Sie natürlich alles selbst kostenfrei konfigurieren.
- Automatische Datenübernahme via DOIs kann auch angeboten werden, so dass nicht alle Daten manuell eingegeben werden müssen.

### Import und Export

* DSpace bietet auch dateibasierten Import, besonders relevant sind im Kontext von Repositorien aber die Schnittstellen:
  * SWORD ermöglicht die Publikation in DSpace auf anderen Webseiten.
  * OAI-PMH ermöglicht es externen Systemen die in DSpace verzeichneten Metadaten abzurufen.
* OAI-PMH-Schnittstelle der DSpace-Demo (Daten erscheinen dort zeitverzögert): <http://demo.dspace.org/oai/request?verb=ListSets>
* Beispiel für Portal auf Basis von OAI-PMH: Die [Bielefeld Academic Search Engine (BASE)](https://www.base-search.net/) "erntet" weltweit OAI-PMH-Schnittstellen und verzeichnet damit weit über 250 Mio. Dokumente.

Note:
- [SWORD](https://en.wikipedia.org/wiki/SWORD_(protocol)) ist eine Schnittstelle, um Publikationen in einem Repository abzuliefern. Damit kann ein Formular mit Dateiupload auf einer Webseite (außerhalb der Repository-Webseite) angeboten werden.
- Um Daten aus dem Repository auf Webseiten anzuzeigen, z.B. eine Publikationsliste, werden andere Schnittstellen wie [RSS-Feeds](https://de.wikipedia.org/wiki/RSS_(Web-Feed)) verwendet.

### Literatur zu DSpace

* Videomitschnitte der Präsentationen auf den jährlichen D/A/CH-Anwendertreffen: https://wiki.lyrasis.org/display/DSPACE/DSpace+Anwendertreffen+2021
* Weitere Demo-Installationen:
  * DSpace 7.x: https://demo7.dspace.org/home (Zugangsdaten wie oben)
  * DSpace 7.x mit DSpace-CRIS: https://dspacecris7.4science.cloud (nur lesend)
* Suchmaschinenoptimierung (SEO): [Abschnitt im Nutzerhandbuch von DSpace zu SEO](https://wiki.lyrasis.org/display/DSDOC7x/Search+Engine+Optimization)

## Marktüberblick Repository-Software

* Grundsätzliches zu Repositorien: <https://open-access.network/informieren/open-access-grundlagen/repositorien>
* Open Directory of Open Access Repositories (OpenDOAR)
  * [Weltweit](https://v2.sherpa.ac.uk/view/repository_visualisations/1.html)
  * [Schweiz](https://v2.sherpa.ac.uk/view/repository_by_country/Switzerland.default.html)
* [Open Access Repository Ranking 2015](https://web.archive.org/web/20160110005003/http://repositoryranking.org/) (via Wayback-Machine)

### Relevante Systeme in D/A/CH

Alle Open Source!

* [DSpace](https://www.dspace.org)
* [EPrints](https://www.eprints.org)
* [Fedora](http://fedorarepository.org) / [Islandora](https://islandora.ca)
* [InvenioRDM](https://invenio-software.org/products/rdm/)
* [MyCoRe](https://www.mycore.de)
* [OPUS](https://www.opus-repository.org)

## Aufgaben

Bis zum nächsten Termin:

1. Beitrag im Lerntagebuch zu dieser Lehreinheit
2. Übung zur OAI-PMH-Schnittstelle und dazu einen Beitrag im Lerntagebuch verfassen
  * Laden Sie von Ihnen erstellte Daten in der DSpace-Demo über die OAI-PMH-Schnittstelle (Daten erscheinen dort zeitverzögert ca. 1 Tag)
  * Achtung: Daten auf [demo.dspace.org](http://demo.dspace.org) werden jeden Samstag nachts gelöscht.
  * Rufen Sie bei einer von Ihnen erstellten Community unter http://demo.dspace.org/oai/request?verb=ListSets den Link "Records" auf
  * Sie finden die Daten jeweils im Kasten "Metadata".
  * Kopieren Sie die Inhalte in einen Texteditor und spei chern Sie diese auf der Festplatte der virtuellen Maschine (z.B. im Ordner "Downloads")
