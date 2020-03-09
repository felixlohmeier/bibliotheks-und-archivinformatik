# Archivsystem ArchivesSpace

## Nachträge zu Fragen und Hinweisen aus den Lerntagebüchern

* Markdown ist formal betrachtet eine [Auszeichnungssprache](https://de.wikipedia.org/wiki/Auszeichnungssprache) ähnlich wie HTML, keine Programmiersprache.
* Was ist der Sinn von Referenz-Links in Markdown? Hier ein Argument: "The point of reference-style links is not that they’re easier to write. The point is that with reference-style links, your document source is vastly more readable." https://daringfireball.net/projects/markdown/syntax#link
* Speicherpunkte in VirtualBox heißen Snapshots (Momentaufnahme des Systems), nicht zu verwechseln mit Screenshots (Bildschirmfoto). Siehe auch Wikipedia-Artikel zu [Schnappschuss_(Informationstechnik)](https://de.wikipedia.org/wiki/Schnappschuss_(Informationstechnik))
* Wir haben den Befehl `git pull` verwendet, um die aktuellen Lehrmaterialien zu laden, aber die Software `git` noch gar nicht kennengelernt. Bei Library Carpentry gibt es bei Interesse [eine ganze Übung dazu](https://librarycarpentry.org/lc-git/) und [in Kapitel 1 auch eine Erklärung](https://librarycarpentry.org/lc-git/01-what-is-git/index.html)
* Koha beinhaltet kein Modul für die Verwaltung von elektronischen Ressourcen, lässt sich aber mit anderen Tools kombinieren. Siehe dazu Vortrag von Katrin Fischer [Koha und ERM - Optionen für die Verwaltung von elektronischen Ressourcen](https://nbn-resolving.org/urn:nbn:de:0290-opus4-35840) auf dem Bibliothekartag 2018.
* Zu MARC21: Stimmt, die hohe internationale Verbreitung ist ein starkes Argument. Bessere Standards, die sich dann nicht durchsetzen, machen die Lage vielleicht schlimmer. Siehe dazu auch xkcd comic: https://xkcd.com/927/

## Metadatenstandards in Archiven

### ISAD(G)

* Als digitale Archivsysteme entwickelt wurden, orientierte sich die Datenstruktur an analogen Findmitteln wie Findbüchern und Zettelkästen
* Ein wichtiger Verzeichnungsstandard im Archivwesen wurde 1994 (Revision 2000) eingeführt, die "International Standard Archival Description (General)" - kurz [ISAD(G)](https://de.wikipedia.org/wiki/ISAD(G)). Grundsätzlich gibt es hier eine mehrstufige Verzeichnung im Provenienzprinzip, um den Entstehungszusammenhang abzubilden.
* Siehe Guidelines ab S. 19 und Anhang 2 S. 54: https://www.ica.org/sites/default/files/CBPS_2000_Guidelines_ISAD%28G%29_Second-edition_DE.pdf
* Grenzen von ISAD(G):
  1. Ein einzelner Datensatz ist unter Umständen nur im Kontext verständlich (z. B. nur "Protokoll" als Titel)
  2. Die Tektonik ist eindimensional (keine Mehrfachzuordnung möglich)
  3. Der Standard enthält keine Vorgaben zur Digitalisierung oder zur digitalen Langzeitarchivierung
* Um Normdateien verzeichnen zu können, wurde später ein ergänzender Standard "International Standard Archival Authority Record for Corporate Bodies, Persons, and Families" - kurz [ISAAR(CPF)](https://de.wikipedia.org/wiki/ISAAR%28CPF%29) verabschiedet. Dieser wird in der Praxis wegen dem Zusatzaufwand bei der Erschließung jedoch nur selten verwendet.
* Aktuell ist ein neuer Standard ["Records in Contexts" (RIC)](https://de.wikipedia.org/wiki/Records_in_Contexts) in Entwicklung.

### EAD

* [Encoded Archival Description](https://de.wikipedia.org/wiki/Encoded_Archival_Description) (EAD) ist ein XML-Standard
* Verschiedene Versionen: EAD2002 und EAD3 (August 2015 veröffentlicht)
* Lässt viele Wahlmöglichkeiten, daher gibt es oft Anwendungsprofile, die genauer spezifizieren welche Werte zugelassen sind.
* Anwendungsfälle: [Archives Portal Europa](https://www.archivesportaleurope.net/de/), Archivportal-D, Kalliope

## Gastbeitrag Michael Gasser (Leiter Archive ETH-Bibliothek)

ORCID: http://orcid.org/0000-0003-0390-1448
Twitter: https://twitter.com/m_gasser

Womit beschäftigt er sich aktuell?
* Sessionvorschlag von Michael Gasser zum [Archivcamp](https://archive20.hypotheses.org/) kommende Woche: Wikidata – Nutzungsmöglichkeiten für Archive https://archive20.hypotheses.org/7358
* Archive der ETH-Bibliothek Zürich umfassen sowohl Bildarchiv als auch das Hochschularchiv

Präsentationsfolien in Moodle:
https://moodle.fhgr.ch/mod/resource/view.php?id=245427 (zugriffsbeschränkt)

**Überblick über die Systemlandschaft: Trennung zwischen Metadatenhaltung, Discovery, Online-Präsentation, digitaler Langzeitarchivierung**

* Schaubild Metadatenflüsse der ETH-Bibliothek: Daten-Verbindungen zwischen den Systemen genauso wichtig geworden, wie die Systeme selbst
  * [x] Das Schaubild werden wir in der letzten Sitzung (10.12.) noch einmal mit den kennengelernten Open-Source-Tools vergleichen
* Systeme werden von der ETH aktuell selbst gehostet und von der ETH Bibliothek administriert, ändert sich durch Projekt SLSP
* Hochschularchiv: CMI Star; Bildarchiv: Canto Comulus (wird heute aus Zeitgründen nicht behandelt)
* für die Online-Präsentation verschiedene Tools und darüber noch das übergreifende Suchportal der ETH-Bibliothek

**Archivinformationssystem CMI STAR: Möglichkeiten und Grenzen von ISAD(G)**

* In der Schweiz vor allem zwei kommerzielle Anbieter: scopeArchiv und CMI STAR
* Wesentliche Elemente von ISAD(G): Provenienz, Tektonik

**Aufgabe**

«Einstein» im [Online Archivkatalog des Staatsarchivs BS](https://query.staatsarchiv.bs.ch/query/suchinfo.aspx)
«Einstein Ehrat» in der [Archivdatenbank Online, Hochschularchiv ETH Zürich](http://archivdatenbank-online.ethz.ch/)

Siehe auch ISAD(G) Guidelines: https://www.ica.org/sites/default/files/CBPS_2000_Guidelines_ISAD%28G%29_Second-edition_DE.pdf

1. Welche Informationen werden auf der Trefferliste präsentiert?
2. Welche Verzeichnungsstufen sind vertreten?
  * Mehrere Stufen vertreten, nach ISAD(G): Bestand, Serie/Aktengruppe, Untergruppe, Akte, Einzelstück/Einheit
3. Sind die ISAD(G)-Informationsbereiche erkennbar?
4. Decken sich die grundlegenden Informationen oder gibt es bemerkenswerte Unterschiede?
5. Worin liegen die zentralen Unterschiede zu einem Bibliothekskatalog?

**Weiter zu CMI STAR**

* Im "Rich-Client" (Programm für die Mitarbeiter\*innen) wird die Erschließung anhand der ISAD(G) Informationsbereiche kategorisiert
* Beinhaltet ein grafisches Mapping-Tool für den Import von Excel oder CSV. Wird verwendet, um Eingaben von Hilfskräften in Excel in das System zu importieren.

**Grenzen von ISAD(G)**

* Projektgruppe [ENSEMEN](https://vsa-aas.ch/arbeitsgruppen/projektgruppe-ensemen/) arbeitet an einer schweizerischen Ausprägung des neuen Standards [Records in Contexts](https://www.ica.org/en/records-contexts-german) (RiC), mit Beteiligung von Niklaus Stettler (FH Graubünden)
  * [x] Anfrage Niklaus Stettler für die Sitzung Linked Data am 11.12. zu RiC

**Normdaten**

* Wegen dem Bibliothekskontext (Archive der ETH-Bibliothek) ist die [GND](https://de.wikipedia.org/wiki/Gemeinsame_Normdatei)-ID von besonderer Bedeutung.
* ETH Zürich ist eine selbständig archivierende Einheit der Bundesarchive *(ist das die formal korrekte Bezeichnung?)*, Unterlagen werden in Zürich gelagert (nicht in Bern)

**Datenaustausch: Einbindung archivischer Verzeichungsinformationen in Discovery Systeme**

* GND-basierte Verlinkungen: über [Entity Facts](https://www.dnb.de/DE/Professionell/Metadatendienste/Datenbezug/Entity-Facts/entity-facts_node.html) und über Vernetzungsinitiative [Metagrid](https://metagrid.ch)
* Beispiel www.e-manuscripta.ch ist angebunden an verschiedene Quellsysteme: Aleph, scopeArchiv und CMI STAR
  * Anderes System in der Schweiz für Handschriften (Schwerpunkt auf Materialien vor 1600): https://www.e-codices.unifr.ch
  * Standard zum Austausch von Digitalisaten [IIIF](https://iiif.io/) hier auch implementiert
* Langzeitarchivierung-Lösung: ETH Data Archive nutzt Infrastruktur

**Informationsverlust – Informationsgewinn: Transformation und Anreicherung von Metadaten**

... (bearbeiten wir später im Discovery-Teil)

**Ausblick**

* Swiss Library Service Platform (SLSP) soll 2021 live gehen und wird viele Grundfunktionalitäten abbilden
* Umstieg von ISAD(G) auf RiC wird mit viel Aufwand verbunden sein, auch mit einem Systemwechsel. Wichtige Herausforderung dabei ist die Einbindung in die Linked Data Cloud.
* Generierung von mehr Volltexten ist von Benutzerwartungen getrieben. Pilotprojekt zu Handwritten Text Recognition (s.o. Transkribus in e-manuscripta)
* Automatisierte Anreicherung von Volltext: Projekte zu Named Entity Recognition bzw. Named Entity Linking
* Virtueller Lesesaal: Bevorstehende Einführung beim Schweizerischen Bundesarchiv (Einsicht nach Anfrage)
* Wikidata zunehmend interessant. Online-Findmittel werden verknüpft mit Wikidata-Einträgen über Property [Archives at](https://www.wikidata.org/wiki/Property:P485). Beispiel Albert Einstein: https://www.wikidata.org/wiki/Q937 (siehe unten "Archives at")

**Diskussion**

* Literaturempfehlung: Was sich Historiker*innen von Archiven wünschen: eine Umfrage – Digital Humanities am DHIP: https://dhdhi.hypotheses.org/6107

## ArchivesSpace

* Offizielle Beschreibung im Wiki: https://archivesspace.atlassian.net/wiki/spaces/ADC/overview
* basiert auf den Standards [DACS](https://en.wikipedia.org/wiki/Describing_Archives:_A_Content_Standard), ISAD(G) und ISAAR(CPF)
* unterstützt Import/Export in EAD, MARCXML und METS

Aus [Fortbildungsmaterialien der NYU](https://guides.nyu.edu/ld.php?content_id=23461999):
> What ASpace does and how do we use it:
> * System of record for archival materials. Not everything is public, or open to staff, nor is it intended to be.
> * Perform core archival functions: accessioning, arrangement and description
> * Aid in public services
> * Record and report location holdings information; stacks management
> * Manage digital objects
> * Produce access tools
> * Statistics gathering, prioritization, holistic planning
> * Contribute to various interdepartmental processes (preservation and digitization)

### Installation

Erstellen Sie zunächst vom aktuellen Stand einen Snapshot in VirtualBox, falls Sie Koha später noch weiter nutzen wollen. Stellen Sie dann den Snapshot vor der Installation von Koha wieder her.

Für die Installation von ArchivesSpace steht wieder ein Notebook als Installationshilfe bereit: https://nbviewer.jupyter.org/github/felixlohmeier/bibliotheks-und-archivinformatik/blob/ed5b5aaa41528a91b3ffa40770c1d459a21395ac/03-archivesspace.ipynb

### Anwenden

* Einführungsvideos: https://www.youtube.com/playlist?list=PL3cxupmXL7WiXaHnpVquPrUUiLiDAMhg0
* Beispieldaten für den Import von EAD: http://eadiva.com/ead-sample-prudence-wayland-smith-papers/

### Alternativen

* Access to Memory (Atom): https://www.accesstomemory.org

## Zusammenfassung

* Unterschiede zwischen Bibliotheks- und Archivsystemen
  * Bibliothek
    * Medium, Benutzerinteraktion (Ausleihe)
    * Software medienzentriert
    * Metadatenformat: MARC21, zukünftig BIBFRAME?
  * Archiv
    * Entstehungszusammenhang, eher stehender Bestand (auf Anfrage)
    * Software orientiert sich an analogen Findmitteln
    * Metadatenformat: EAD, zukünftig RiC
    * Herausforderung: Digitalisierung (Virtueller Lesesaal), Verknüpfungen/Mehrfachzuordnungen (Linked Data)
* Herausforderung: Vernetzung von Systemen, Datenaustausch zwischen den Systemen (kommen wir später darauf zurück)