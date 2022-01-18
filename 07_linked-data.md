# Linked Data und Testumgebung

* Ergebnis der Unterrichtsevaluation
* Aktuelle Datenmodelle für Metadaten (BIBFRAME, RiC)
* Praxisberichte
* Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service
* Empfehlenswerte Tutorials zum Selbstlernen

## Ergebnis der Unterrichtsevaluation

* Gemeinsame Sichtung der (anonymen) Auswertung
  * Rückmeldungen: 20
  * Gesamtbewertung: auf Skala 1 (unzufrieden) bis 7 (zufrieden)
    * 3x 7
    * 6x 6
    * 7x 5
    * 1x 4
    * 3x 3
* Positive Aspekte der Lehrveranstaltung aus Sicht der Studierenden
   * Inhalt
   * Gestaltung
   * Praxisbezug
   * Materialien
   * Fachliche Kompetenz
   * Umgang mit Studierenden
   * Betreuung
* Negative Aspekte der Lehrveranstaltung aus Sicht der Studierenden
   * Inhalt (vermutlich für Schwerpunkt Web- und Usability-Engineering?)
   * Transparenz der Lernziele
   * Forschungsbezug
   * Zeitmanagement
* Verbesserungsmaßnahmen
  * Bei jedem Thema Bezug zu Lernzielen erläutern
  * Zusätzliche Möglichkeiten zur Überprüfung des Lernfortschritts
    * z.B. Zwischenfeedback für Lerntagebücher
  * Genauere Zielvorgabe bei Übungen

## Aktuelle Datenmodelle für Metadaten (BIBFRAME, RiC)

1. BIBFRAME
2. Records in Contexts (RiC)

### BIBFRAME

* seit 2012 auf Initiative der Library of Congress als Nachfolger von MARC21 (und MODS) entwickelt, aktuell ist seit 2016 BIBFRAME 2.0
* basiert auf *Functional Requirements for Bibliographic Records* (FRBR) sowie *Resource Description and Access* (RDA) als Regelwerk, setzt diese aber nicht vollständig um
* folgt Linked Data Paradigmen
* besteht aus *BIBFRAME Model* und *BIBFRAME Vocabulary*
  * Datenmodell unterscheidet zwischen *Work*, *Instance* und *Item*
  * Datenmodell definiert Entitäten *Agent*, *Subject* und *Event*
  * Vokabular definiert *Konzepte* und deren *Eigenschaften* zur Beschreibung der Entitäten des Datenmodells

#### BIBFRAME Model

![BIBFRAME Model](https://www.loc.gov/bibframe/docs/images/bf2-model.jpg)

Quelle: <https://www.loc.gov/bibframe/docs/bibframe2-model.html>

#### BIBFRAME Vocabulary

* Ontologie umfasst Beschreibungsklassen (*Class*), die jeweils über spezifische Eigenschaften (*Property*) verfügen
  * vergleichbar mit MARC Fields und Subfields
* Klassen/Eigenschaften sind teilweise hierarchisch strukturiert
  * z. B. "Autor" ist Spezialfall (*Subclass*) eines "Beiträgers"
* übernimmt die Konzepte von RDA
* siehe <https://id.loc.gov/ontologies/bibframe.html>

#### Was unterscheidet MARC21 und BIBFRAME? (1/2)

> As a bibliographic description format, the MARC format focuses on catalog records that are independently understandable. MARC aggregates information about the conceptual work and its physical carrier and uses strings for identifiers such as personal names, corporate name, subjects, etc. that have value outside the record itself.

Quelle: <https://www.loc.gov/bibframe/faqs/#q04>

#### Was unterscheidet MARC21 und BIBFRAME? (2/2)

> Instead of bundling everything neatly as a “record” and potentially duplicating information across multiple records, the BIBFRAME Model relies heavily on relationships between resources (Work-to-Work relationships; Work-to-Instance relationships; Work-to-Agent relationships). It manages this by using controlled identifiers for things (people, places, languages, etc).

Quelle: <https://www.loc.gov/bibframe/faqs/#q04>

#### BIBFRAME Links

* [BIBFRAME bei der Library of Congress](https://www.loc.gov/bibframe/)
* [Gegenüberstellung BIBFRAME <-> MARCXML](https://id.loc.gov/tools/bibframe/comparebf-lccn/2018958785.xml)
* [Präsentationen zu BIBFRAME auf der SWIB20](https://swib.org/swib20/programme.html)

### Records in Contexts (RiC)

* basiert auf Linked-Data-Prinzipien
* soll neue und mehrfache Beziehungen zwischen Entitäten ermöglichen
* Projektgruppe [ENSEMEN](https://vsa-aas.ch/arbeitsgruppen/projektgruppe-ensemen/) arbeitet an einer schweizerischen Ausprägung des neuen Standards [Records in Contexts](https://www.ica.org/en/records-contexts-german) (RiC), mit Beteiligung von Niklaus Stettler (FH Graubünden)

#### RiC Modell

* <https://www.ica.org/sites/default/files/ric-cm-02_july2021_0.pdf> (Druck S. 18 / PDF S. 23)

#### RiC Ontologie

* <https://www.ica.org/standards/RiC/ontology>
* Beispieldateien: <https://github.com/ICA-EGAD/RiC-O/tree/master/examples/examples_v0-2>

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

## Praxisberichte

### Entwicklung eines neuen Online-Katalogs für das Deutsche Literaturarchiv Marbach

* Katalog (Beta): <https://www.dla-marbach.de/katalog-beta>
* Informationen zum Projekt: <https://wdv-teamwork.dla-marbach.de/projects/info-opac-ng-hauptprojekt/wiki>
* Unser Auftrag: Prototyp, Projektkoordination und Datenintegration
* Geschwindigkeitsmessung mit "Network"-Funktion der Entwicklertools

### Datenintegration für das Portal noah.nrw

* Portal für Open-Access-Ressourcen in Nordrhein-Westfalen: https://noah.nrw. Besondere Funktion: Volltextsuche für Digitalisate **und** Born-Digitals.
* Unser Auftrag: Daten von OAI-Schnittstellen abrufen, einheitlich in Format METS/MODS konvertieren und über eine OAI-Schnittstelle bereitstellen
* Ein anderer Dienstleister erntet dann die von uns bereitgestellten OAI-Schnittstellen und kümmert sich um die Anzeige im Portal
* Beispiel Datenquelle Biejournals: <https://github.com/opencultureconsulting/noah-biejournals>

## Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service

* Handout zum Query Service: <https://www.wikidata.org/wiki/File:Wikidata_Query_Service_kurzgefasst.pdf>
* Query-Service: <https://query.wikidata.org> (dort integrierte Beispiele)
* Weitere Beispiele: <https://blog.wikimedia.de/2016/10/30/10-coole-wikidata-abfragen-die-dir-neue-horizonte-eroeffnen-nummer-7-wird-dich-schockieren/>

### Tutorial

* Alex Stinson hat ein schönes Tutorial geschrieben, das eigentlich für Lehrende gedacht ist, aber auch individuell bearbeitet werden kann. Nach einer Einleitung, die sich an Lehrende richtet, kommt unter der Überschrift "Writing a Query" das Skript.
* Aufgabe (30 Minuten): Bearbeiten Sie das Tutorial ab der Überschrift "Writing a Query": <https://medium.com/freely-sharing-the-sum-of-all-knowledge/writing-a-wikidata-query-discovering-women-writers-from-north-africa-d020634f0f6c>

### Literatur

* Empfehlenswerte Tutorials zu SPARQL:
  * <https://programminghistorian.org/en/lessons/intro-to-linked-data>
  * <https://programminghistorian.org/en/lessons/graph-databases-and-SPARQL>
* Beispiel, wie das Hochschularchiv der ETH-Bibliothek Wikidata nutzt:
  * How to Link Your Institution’s Collections to Wikidata? : a short manual to a semi-automatic way of using the “archives at” property (P485) <https://doi.org/10.3929/ethz-b-000393724>

---

## Empfehlenswerte Tutorials zum Selbstlernen

* Library Carpentry: <https://librarycarpentry.org/lessons/>
* Programming Historian: <https://programminghistorian.org/en/lessons/>
* openHPI: <https://open.hpi.de/courses>
* Datenschule: <https://datenschule.de/lernmaterialien/>

---

# Aufgaben

Bis zum Abgabetermin der Lerntagebücher:

1. Beitrag im Lerntagebuch zu dieser Lehreinheit (3000 - 4000 Zeichen)
2. Abschlussartikel: “Was habe ich (nicht) gelernt?” (3000 - 4000 Zeichen)
3. Lerntagebuch fertigstellen (ggf. ältere Beiträge korrigieren und ergänzen). Bewertungskriterien:
  * begründete kritische Auseinandersetzung mit den Lerninhalten
  * Kontextualisierung der Lerninhalte (Zusatzinformationen, Querverweise, Screenshots)
  * verständliche Darstellung in eigenen Worten
  * Vollständigkeit und Einhaltung der Form
