# Linked Data und Testumgebung

1. Metadaten anreichern mit OpenRefine und Wikidata (45 Minuten)
2. Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service (45 Minuten)
3. Testumgebung für Server-Software (30 Minuten)
4. Empfehlenswerte Tutorials zum Selbstlernen (5 Minuten)

Wir schauen uns hier in den verbleibenden zwei Lektionen das praktische Beispiel Wikidata an, dass für Bibliotheken und Archive zunehmend an Relevanz gewinnt. Ein Beispiel: Swissbib nutzt seit März 2020 die Daten aus Wikidata, siehe https://swissbib.blogspot.com/2020/03/wikidata.html.

## Metadaten anreichern mit OpenRefine und Wikidata

**Aufgabe (30 Minuten)**: Wir bearbeiten gemeinsam Teile des Tutorials "Cleaning Data with OpenRefine" von John Little (2018). Die Aufgaben unten enthalten Auszüge aus [Kapitel 5 Hands-on: Reconciliation](https://libjohn.github.io/openrefine/hands-on-reconciliation.html).

### Aufgabe 1: Neues Projekt

* `Create Project > Web Addresses (URLs)`
  * https://raw.githubusercontent.com/libjohn/openrefine/master/data/AA-authors-you-should-read.csv
  * `Next`
* You many want to give your project a pretty title
  * Ja und bitte zusätzlich ein Namenskürzel/Pseudonym, damit wir uns auf dem Server nicht in die Quere kommen.
* `Create Project`
* Change Show: to 25 to see all 11 records.

### Aufgabe 2: Reconciliation

* `authors > Reconcile > Start reconciling…`
  * Under Services, click Wikidata Reconciliation for OpenRefine (en)
  * Under Reconcile each cell to an entity of one of these types:, choose, `human`
  * Click, `Start Reconciling`
* By clicking the approriate single checkbox in each cell of the authors column, manually select the most appropriate author for our topic. (...) Cells 2, 10 need your intervention.
  * In Cell 2, James Baldwin, select the first option which a match of “(100)”
  * In Cell 10, Click on the first name, then the second name. Do you see an African-American writer? Choose him by clicking the corresponding single check-mark

### Aufgabe 3: Daten aus Wikidata ergänzen

* `authors > Edit column > Add columns from reconciled values…`
  * Under Suggested Properties, click place of birth and place of death
  * OK

### Literatur: Reconciliation mit OpenRefine

* Gemeinsame Normdatei (GND) über die API von lobid-gnd: <http://blog.lobid.org/2018/08/27/openrefine.html>
* Tutorial zu Reconciling bei histHub: <https://histhub.ch/reconciling/>
* Weitere Datenquellen, welche die OpenRefine Reconciliation API unterstützen: <https://github.com/OpenRefine/OpenRefine/wiki/Reconcilable-Data-Sources>
* Und es können auch Daten manuell aus dem Web geladen und zur Anreicherung verwendet werden. Das ist aber mühseliger. Dazu ein Tutorial: <https://programminghistorian.org/en/lessons/fetch-and-parse-data-with-openrefine>

## Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service

* Handout zum Query Service: <https://www.wikidata.org/wiki/File:Wikidata_Query_Service_kurzgefasst.pdf>
* Query-Service: <https://query.wikidata.org> (dort integrierte Beispiele)
* Weitere Beispiele: <https://blog.wikimedia.de/2016/10/30/10-coole-wikidata-abfragen-die-dir-neue-horizonte-eroeffnen-nummer-7-wird-dich-schockieren/>

### Tutorial

* Alex Stinson hat ein schönes Tutorial geschrieben, das eigentlich für Lehrende gedacht ist, aber auch individuell bearbeitet werden kann. Nach einer Einleitung, die sich an Lehrende richtet, kommt unter der Überschrift "Writing a Query" das Skript.
* **Aufgabe (30 Minuten): ** Bearbeiten Sie das Tutorial ab der Überschrift "Writing a Query": https://medium.com/freely-sharing-the-sum-of-all-knowledge/writing-a-wikidata-query-discovering-women-writers-from-north-africa-d020634f0f6c

### Literatur

* Empfehlenswerte Tutorials zu SPARQL:
  * https://programminghistorian.org/en/lessons/intro-to-linked-data
  * https://programminghistorian.org/en/lessons/graph-databases-and-SPARQL
* Beispiel, wie das Hochschularchiv der ETH-Bibliothek Wikidata nutzt:
  * How to Link Your Institution’s Collections to Wikidata? : a short manual to a semi-automatic way of using the “archives at” property (P485) https://doi.org/10.3929/ethz-b-000393724

## Testumgebung für Server-Software

* Während des Kurses besteht Zugriff auf die virtuellen Maschinen bei Azure Labs. Nach Ende des Kurses entfällt diese Möglichkeit.
* Wenn Sie zukünftig einmal Server-Software testen möchten, gibt es unabhängig von der Hochschule diverse Möglichkeiten.

### Vergleich Cloud vs. Lokal

* Cloud: Root-Server (Webserver mit vollem Administrationszugriff) bei einem Webhosting-Anbieter
* Cloud: Plattformen von Microsoft (Azure), Google (GCP), Amazon (AWS): [Kosten-Rechner](https://www.microfin.de/produkte/tools/cloud-kosten-rechner/)
* Lokal: [VirtualBox](https://www.virtualbox.org) (Virtuelle Maschinen)
* Lokal: [Docker Desktop](https://www.docker.com/products/docker-desktop) (Container)
* Lokal: Booten von USB-Stick oder USB-Festplatte: [Anleitung aus BAIN HS19](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/blob/v2.0/notes_bootfaehige-usb-sticks-erstellen.md)

### OpenRefine auf Root-Server

* In diesem Kurs zeige ich Ihnen die klassische Variante "Root-Server", weil dies per Videokonferenz geht und übersichtlicher ist als die Cloud-Plattformen.
* Wir nutzen dafür den Anbieter [Digitalocean](https://digitalocean.com), weil dieser Minutenpreise und eine einfache Benutzeroberfläche anbietet.
* Als Anwendungsfall installieren wir OpenRefine, da wir dieses für die kommende Aufgabe gebrauchen können.
  * [Anleitung ohne Authentifizierung von mir](https://gist.github.com/felixlohmeier/0ec8b2e8241356ed52af072d9102b391)
  * [Anleitung mit Authentifizierung von Tony Hirst](https://blog.ouseful.info/2019/01/07/running-openrefine-on-digital-ocean-using-simple-auth/) (dort auch ein Link für 100 Dollar Startkredit bei Digitalocean)

## Empfehlenswerte Tutorials zum Selbstlernen

* Library Carpentry: https://librarycarpentry.org/lessons/
* Programming Historian: https://programminghistorian.org/en/lessons/
* openHPI: https://open.hpi.de/courses
* Datenschule: https://datenschule.de/lernmaterialien/