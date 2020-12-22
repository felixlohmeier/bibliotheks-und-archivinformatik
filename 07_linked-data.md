# Linked Data und Testumgebung

- Ergebnis der Unterrichtsevaluation
- Aktuelle Datenmodelle für Metadaten (BIBFRAME, RiC)
- Praxisberichte
- Metadaten anreichern mit OpenRefine und Wikidata
- Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service
- Empfehlenswerte Tutorials zum Selbstlernen

## Ergebnis der Unterrichtsevaluation

* Gemeinsame Sichtung der (anonymen) Auswertung in Moodle
* Ergebnis: 4,82 auf Skala 1 (--) bis 5 (++)
* Positive Aspekte der Lehrveranstaltung aus Sicht der Studierenden
  * CodiMD als Tool für gemeinsames Dokument
  * Schaubild für Lehrinhalte
  * Prüfungsleistung Lerntagebuch
* Negative Aspekte der Lehrveranstaltung aus Sicht der Studierenden
  * kein Zwischenfeedback für die Prüfungsleistung (Lerntagebücher)
  * allgemein in der Corona-Situation: Kombination aus Isolation und Termindruck
* Verbesserungsmaßnahmen
  * Zwischenfeedback für die Lerntagebücher
  * Ausführliche Praxisbeispiele nicht erst in der letzten Sitzung
  * Übungen noch mehr an Anwendungsfällen aus der Praxis ausrichten

## Aktuelle Datenmodelle für Metadaten

1. BIBFRAME
2. Records in Context (RiC)

### BIBFRAME

* seit 2012 auf Initiative der Library of Congress als Nachfolger von MARC21 (und MODS) entwickelt, aktuell ist seit 2016 BIBFRAME 2.0
* basiert auf *Functional Requirements for Bibliographic Records* (FRBR) sowie *Resource Description and Access* (RDA) als Regelwerk, setzt diese aber nicht vollständig um
* folgt Linked Data Paradigmen
* besteht aus *BIBFRAME Model* und *BIBFRAME Vocabulary*
    * Datenmodell unterscheidet zwischen *Work*, *Instance* und *Item*
    * Datenmodell definiert Entitäten *Agent*, *Subject* und *Event*
    * Vokabular definiert *Konzepte* und deren *Eigenschaften* zur Beschreibung der Entitäten des Datenmodells

Links:

* BIBFRAME bei der Library of Congress: <https://www.loc.gov/bibframe/>
* Gegenüberstellung BIBFRAME <-> MARCXML: <https://id.loc.gov/tools/bibframe/comparebf-lccn/2018958785.xml>
* Präsentationen zu BIBFRAME auf der SWIB20: <https://swib.org/swib20/programme.html>

#### BIBFRAME Model

![BIBFRAME Model](https://www.loc.gov/bibframe/docs/images/bf2-model.jpg)

Quelle: <https://www.loc.gov/bibframe/docs/bibframe2-model.html>

#### BIBFRAME Vocabulary

* Ontologie umfasst Beschreibungsklassen (*Class*), die jeweils über spezifische Eigenschaften (*Property*) verfügen
    * vergleichbar mit MARC Fields und Subfields
* Klassen/Eigenschaften sind teilweise hierarchisch strukturiert
    * z. B. "Autor" ist Spezialfall (*Subclass*) eines "Beiträgers"
* übernimmt die Konzepte von RDA
* siehe https://id.loc.gov/ontologies/bibframe.html

#### Was unterscheidet MARC21 und BIBFRAME? (1/2)

> As a bibliographic description format, the MARC format focuses on catalog records that are independently understandable. MARC aggregates information about the conceptual work and its physical carrier and uses strings for identifiers such as personal names, corporate name, subjects, etc. that have value outside the record itself.

Quelle: <https://www.loc.gov/bibframe/faqs/#q04>

#### Was unterscheidet MARC21 und BIBFRAME? (2/2)

> Instead of bundling everything neatly as a “record” and potentially duplicating information across multiple records, the BIBFRAME Model relies heavily on relationships between resources (Work-to-Work relationships; Work-to-Instance relationships; Work-to-Agent relationships). It manages this by using controlled identifiers for things (people, places, languages, etc).

Quelle: <https://www.loc.gov/bibframe/faqs/#q04>

### Records in Context (RiC)

* basiert auf Linked-Data-Prinzipien
* soll neue und mehrfache Beziehungen zwischen Entitäten ermöglichen
* Projektgruppe [ENSEMEN](https://vsa-aas.ch/arbeitsgruppen/projektgruppe-ensemen/) arbeitet an einer schweizerischen Ausprägung des neuen Standards [Records in Contexts](https://www.ica.org/en/records-contexts-german) (RiC), mit Beteiligung von Niklaus Stettler (FH Graubünden)

#### RiC Modell

* <https://www.ica.org/sites/default/files/session-7.8-ica-egad-ric-congress2016.pdf> (S. 19)

#### RiC Ontologie

* <https://www.ica.org/standards/RiC/ontology>
* Beispieldateien: <https://github.com/ICA-EGAD/RiC-O/tree/master/examples/NationalArchivesOfFrance>

#### RiC Tools

* Open-Source-Software [RiC-O Converter](https://github.com/ArchivesNationalesFR/rico-converter)
  * "for converting into RDF datasets conforming to RiC-O v0.1 the whole of the ANF EAD 2002 findings aids (about 28.000 XML files for now) and EAC-CPF authority records (about 15.000 XML files for now)"
  * [Artikel zur Veröffentlichung des Quellcodes](https://blog-ica.org/2020/06/13/ric-o-converter-an-example-of-practical-application-of-the-ica-records-in-contexts-standard-ica-ric/)
* Docuteam arbeitet an Prototypen für Erschließungs- und Katalogsoftware, siehe https://ica-egad.github.io/RiC-O/projects-and-tools.html

#### RiC Links

* Einführungsartikel: David Gniffke (16.3.2020): Semantic Web und Records in Contexts (RiC). In: Archivwelt, 16/03/2020. <https://archivwelt.hypotheses.org/1982>
* Präsentation: Florence Clavaud <https://f.hypotheses.org/wp-content/blogs.dir/2167/files/2020/02/20200128_2_RecordsInContexts_englishVersionAdded1003.pdf>
* Arbeitsgruppe ICA EGAD: <https://www.ica.org/en/about-egad>
* RiC Ontologie 0.2 (2019): <http://purl.org/ica/ric>
* Access To Memory (AtoM) - Alternative zu ArchivesSpace, näher dran an RiC-Entwicklung: <https://www.accesstomemory.org>
* Archival Linked Open Data (aLOD): <http://www.alod.ch>

## Praxisberichte (zur Auswahl)

* [Normdatenbasierter Online-Katalog für das Deutsche Literaturarchiv Marbach](https://nbn-resolving.org/urn:nbn:de:0290-opus4-161900)
* Datenintegration für das [Portal noah.nrw](https://noah.nrw)
* Workshop zur Wahl eines Discovery-Systems: ["RDS-Gespräch" für Max-Planck-Institute](https://docs.google.com/presentation/d/1r7_VSY30rAm8YMz3nVYjOdUStnz4BovSXMHjxGbbvkM/edit)
* [Datenkonvertierung von Bibliotheca zu PICA+ für die Berufsakademien Sachsen](https://github.com/felixlohmeier/ba-sachsen-pica)

## Testumgebung für Server-Software

* Während des Kurses besteht Zugriff auf die virtuellen Maschinen bei der FH Graubünden. Nach Ende des Kurses entfällt diese Möglichkeit.
* Wenn Sie zukünftig einmal Server-Software testen möchten, gibt es unabhängig von der Hochschule diverse Möglichkeiten.

### Vergleich Cloud vs. Lokal

* Cloud: Root-Server (Webserver mit vollem Administrationszugriff) bei einem Webhosting-Anbieter
* Cloud: Plattformen von Microsoft (Azure), Google (GCP), Amazon (AWS): [Kosten-Rechner](https://www.microfin.de/produkte/tools/cloud-kosten-rechner/)
* Lokal: [VirtualBox](https://www.virtualbox.org) (Virtuelle Maschinen)
* Lokal: [Docker Desktop](https://www.docker.com/products/docker-desktop) (Container)
* Lokal: Booten von USB-Stick oder USB-Festplatte: [Anleitung aus BAIN HS19](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/blob/v2.0/notes_bootfaehige-usb-sticks-erstellen.md)

### OpenRefine auf Root-Server

* In diesem Kurs zeigen wir Ihnen die klassische Variante "Root-Server", weil dies per Videokonferenz geht und übersichtlicher ist als die Cloud-Plattformen.
* Wir nutzen dafür den Anbieter [Digitalocean](https://digitalocean.com), weil dieser Minutenpreise und eine einfache Benutzeroberfläche anbietet.
* Als Anwendungsfall installieren wir OpenRefine, da wir dieses für die kommende Aufgabe gebrauchen können.
  * [Anleitung ohne Authentifizierung](https://gist.github.com/felixlohmeier/0ec8b2e8241356ed52af072d9102b391)
  * [Anleitung mit Authentifizierung von Tony Hirst](https://blog.ouseful.info/2019/01/07/running-openrefine-on-digital-ocean-using-simple-auth/) (dort auch ein Link für 100 Dollar Startkredit bei Digitalocean)

## Wikidata

### Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service

* Handout zum Query Service: <https://www.wikidata.org/wiki/File:Wikidata_Query_Service_kurzgefasst.pdf>
* Query-Service: <https://query.wikidata.org> (dort integrierte Beispiele)
* Weitere Beispiele: <https://blog.wikimedia.de/2016/10/30/10-coole-wikidata-abfragen-die-dir-neue-horizonte-eroeffnen-nummer-7-wird-dich-schockieren/>

#### Tutorial

* Alex Stinson hat ein schönes Tutorial geschrieben, das eigentlich für Lehrende gedacht ist, aber auch individuell bearbeitet werden kann. Nach einer Einleitung, die sich an Lehrende richtet, kommt unter der Überschrift "Writing a Query" das Skript.
* Aufgabe (30 Minuten): Bearbeiten Sie das Tutorial ab der Überschrift "Writing a Query": https://medium.com/freely-sharing-the-sum-of-all-knowledge/writing-a-wikidata-query-discovering-women-writers-from-north-africa-d020634f0f6c

#### Literatur

* Empfehlenswerte Tutorials zu SPARQL:
  * https://programminghistorian.org/en/lessons/intro-to-linked-data
  * https://programminghistorian.org/en/lessons/graph-databases-and-SPARQL
* Beispiel, wie das Hochschularchiv der ETH-Bibliothek Wikidata nutzt:
  * How to Link Your Institution’s Collections to Wikidata? : a short manual to a semi-automatic way of using the “archives at” property (P485) https://doi.org/10.3929/ethz-b-000393724

### Metadaten anreichern mit OpenRefine und Wikidata

**Aufgabe (30 Minuten)**: Wir bearbeiten gemeinsam Teile des Tutorials "Cleaning Data with OpenRefine" von John Little (2018). Die Aufgaben unten enthalten Auszüge aus [Kapitel 5 Hands-on: Reconciliation](https://libjohn.github.io/openrefine/hands-on-reconciliation.html).

#### Aufgabe 1: Neues Projekt

* `Create Project > Web Addresses (URLs)`
  * https://raw.githubusercontent.com/libjohn/openrefine/master/data/AA-authors-you-should-read.csv
  * `Next`
* You many want to give your project a pretty title
* `Create Project`
* Change Show: to 25 to see all 11 records.

#### Aufgabe 2: Reconciliation

* `authors > Reconcile > Start reconciling…`
  * Under Services, click Wikidata Reconciliation for OpenRefine (en)
  * Under Reconcile each cell to an entity of one of these types:, choose, `human`
  * Click, `Start Reconciling`
* By clicking the approriate single checkbox in each cell of the authors column, manually select the most appropriate author for our topic. (...) Cells 2, 10 need your intervention.
  * In Cell 2, James Baldwin, select the first option which a match of “(100)”
  * In Cell 10, Click on the first name, then the second name. Do you see an African-American writer? Choose him by clicking the corresponding single check-mark

#### Aufgabe 3: Daten aus Wikidata ergänzen

* `authors > Edit column > Add columns from reconciled values…`
  * Under Suggested Properties, click place of birth and place of death
  * OK

#### Literatur: Reconciliation mit OpenRefine

* Weitere Datenquellen, welche die OpenRefine Reconciliation API unterstützen: <https://github.com/OpenRefine/OpenRefine/wiki/Reconcilable-Data-Sources>
* Und es können auch Daten manuell aus dem Web geladen und zur Anreicherung verwendet werden. Das ist aber mühseliger. Dazu ein Tutorial: <https://programminghistorian.org/en/lessons/fetch-and-parse-data-with-openrefine>

## Empfehlenswerte Tutorials zum Selbstlernen

* Library Carpentry: <https://librarycarpentry.org/lessons/>
* Programming Historian: <https://programminghistorian.org/en/lessons/>
* openHPI: <https://open.hpi.de/courses>
* Datenschule: <https://datenschule.de/lernmaterialien/>
