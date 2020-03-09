# Linked Data und Fazit

## Nachträge zu Themen aus Lerntagebüchern

* Unterschied zwischen upgrade und dist-upgrade
  > `dist-upgrade` bringt die installierten Pakete auf den neuesten in den Paketquellen verfügbaren Stand. Hierbei werden im Gegensatz zu upgrade neue Pakete installiert und durch neue Abhängigkeiten unnötig gewordene Pakete ersetzt, auch wenn dies alte Abhängigkeiten beeinflusst. `dist-upgrade` benötigt keine Angabe von Paketnamen.
  > https://wiki.ubuntuusers.de/apt/apt-get/#apt-get-dist-upgrade
* Nochmal rekapitulieren: Was haben wir beim Ausflug in die MySQL-Konfiguration eingestellt?
  > If you wish to connect to the root account through the web-based installer in order to set up VuFind's database, you will need to disable the root account's “auth_socket” plugin, which prevents regular logins.
  > https://vufind.org/wiki/installation:ubuntu#database_issues
* Hat Zenodo auch Nachteile?
  * Jeder Record bekommt gleich bei Erstellung zwei DOIs, um Versionierung zu unterstützen. Eine DOI verweist stets auf die "aktuellste" Version (variabel), die andere auf exakt diese hochgeladene Version (fix). Ob das ein Vorteil oder Nachteil ist, ist Ansichtssache.
  * Details: https://help.zenodo.org

## Metadaten aus Wikidata anreichern mit OpenRefine

Wir haben OpenRefine auf einem temporärem Webserver genutzt. Installationsanleitung: https://gist.github.com/felixlohmeier/0ec8b2e8241356ed52af072d9102b391

Wir bearbeiten gemeinsam Teile des Tutorials https://libjohn.github.io/openrefine/hands-on-reconciliation.html (nur Wikidata):

Make a New Project, Import Author Data
* `Create Project > Web Addresses (URLs)` > https://raw.githubusercontent.com/libjohn/openrefine/master/data/AA-authors-you-should-read.csv
* `Next` >>
* You many want to give your project a pretty title
* `Create Project` >>
* Change Show: to 25 to see all 11 records.

Reconciliation:
* `author > Reconcile > Start reconciling…`
* Under Services, click Wikidata Reconciliation for OpenRefine (en)
* Under Reconcile each cell to an entity of one of these types:, choose, `human`
* Click, `Start Reconciling`
* By clicking the approriate single checkbox in each cell of the authors column, manually slect the most appropriate author for our topic. (Our topic is African American Authors everyone should read). Not every cell has an author for which you must make a selection. Cells 2, 10 need your intervention.
* In Cell 2, James Baldwin, select the first option which a match of “(100)”
* In cell 10, Click on the first name, then the second name. Do you see an African-American writer? Choose him by clicking the corresponding single check-mark

Add more metadata from Wiki Data (only works for Wikidata as of this writing)
* `authors > Edit column > Add columns from reconciled values…`
* Under Suggested Properties, click place of birth and place of death
* OK

Übrigens: Es gibt auch einen Reconciliation-Endpoint für die Gemeinsame Normdatei (GND), vgl. http://blog.lobid.org/2018/08/27/openrefine.html

## Gastbeitrag Niklaus Stettler zu Records in Context (RiC)

Gastbeitrag Niklaus Stettler

Links:
* Thesaurus Termdat: https://www.bk.admin.ch/bk/de/home/dokumentation/sprachen/termdat.html
* Arbeitsgruppe ICA EGAD https://www.ica.org/en/about-egad
* RiC Ontologie 0.2 (2019): http://purl.org/ica/ric
* Access To Memory (AtoM) - Alternative zu ArchivesSpace, näher dran an RiC-Entwicklung: https://www.accesstomemory.org
* Archival Linked Open Data (aLOD): http://www.alod.ch
* Projektgruppe ENSEMEN: https://vsa-aas.ch/arbeitsgruppen/projektgruppe-ensemen/

## Suchanfragen mit SPARQL am Beispiel des Wikidata Query Service

Query-Service: https://query.wikidata.org (dort integrierte Beispiele)

Weitere Beispiele: https://blog.wikimedia.de/2016/10/30/10-coole-wikidata-abfragen-die-dir-neue-horizonte-eroeffnen-nummer-7-wird-dich-schockieren/

Tutorial:
* https://medium.com/freely-sharing-the-sum-of-all-knowledge/writing-a-wikidata-query-discovering-women-writers-from-north-africa-d020634f0f6c

Mehr zu SPARQL:
* https://programminghistorian.org/en/lessons/intro-to-linked-data
* https://programminghistorian.org/en/lessons/graph-databases-and-SPARQL

Linked Data Rechercheportal und Schnittstelle für die Daten der GND: https://lobid.org/gnd

## Evaluation

Methode: Kärtchenabfrage mit Pinnwandtechnik

> Die Gruppendiskussion wird mit zwei bis drei Fragen in Gang gebracht:
>
> 1. Wie beurteilen Sie die Lehrveranstaltung insgesamt?

Skala: sehr gut (4), gut (3), genügend (2). ungenügend (1)
Farbe: rund, orange

> 2. Was/Welches Verhalten der Lehrperson hat Ihnen das Lernen in diesem Kurs leicht/schwer gemacht? Bitte nennen Sie 1 bis 2 Beispiele.

Farbe: rechteckig, grün

> 3. Machen Sie bitte ein bis zwei konkrete Vorschläge, welche die Lehrperson umsetzen könnte, um Ihren Lernerfolg in diesem Kurs zu unterstützen.

Farbe: rechteckig, gelb

> Die Lehrperson (oder eine Moderation) schreibt die Fragen auf die Tafel oder eine Folie. Die Studierenden werden gebeten, die Antworten zunächst auf Kärtchen zu schreiben. Die Kärtchen werden (anonym) eingesammelt und vorgestellt. Die Lehrperson gruppiert die gesammelten Antworten, um Schwerpunkte bei den Antworten herauszufinden (Abb. 1).
>
> Es ist darauf zu achten, dass am Ende der Diskussion oder am Beginn der nächsten Veranstaltung ein abschliessendes Feedback zur Diskussion gestellt wird und dass realistische und konkrete Ziele formuliert werden.

## Diagramm zu Kursinhalten erstellen

Wir haben im Kurs verschiedene Software, Metadatenstandards und Schnittstellen kennengelernt. Versuchen Sie aus dem Gedächtnis einen Flowchart zu möglichen Datenflüssen zwischen den im Kurs kennengelernten Systemen (ähnlich dem Metadatenflussdiagramm der ETH-Bibliothek) zu skizzieren.

Nutzen Sie dazu den Mermaid live editor: https://mermaid-js.github.io/mermaid-live-editor/ oder alternativ ein Blatt Papier

## Install-Party

Welches Tool war für Sie persönlich am nützlichsten? Bitte wählen Sie eins aus und installieren Sie das in Gruppenarbeit dauerhaft auf Ihrem Rechner.

Gruppe 1: VirtualBox

* Neue Virtuelle Maschine mit Standard-Linux-Installation erstellen, z.B. mit Standard Ubuntu https://ubuntu.com/download oder einem anderen Linux (vgl. https://distrowatch.com)
* Vorgefertigte VirtualBox Appliances bei TurnKey Linux: https://www.turnkeylinux.org

Gruppe 2: OpenRefine unter Windows / MacOS

* Download: http://openrefine.org/download.html
* Installationsanleitung: https://github.com/OpenRefine/OpenRefine/wiki/Installation-Instructions
* benötigt Java https://www.java.com/de/download/

Gruppe 3: Eigenen temporären Webserver bei einem Cloud-Hoster einrichten (z.B. mit OpenRefine)

* Anleitung mit Authentifizierung: https://blog.ouseful.info/2019/01/07/running-openrefine-on-digital-ocean-using-simple-auth/ (dort auch Link für $100 Startkredit bei Digital Ocean)
* Anleitung ohne Authentifizierung (wie heute Vormittag): https://gist.github.com/felixlohmeier/0ec8b2e8241356ed52af072d9102b391

Gruppe 4: Ein guter Texteditor

* Typora (Markdown, Win/Mac/Linux): https://www.typora.io
  * Pandoc für Import/Export: http://support.typora.io/Install-and-Use-Pandoc/
* Notepad++ (Win): https://notepad-plus-plus.org
* Atom (Win/Mac/Linux) https://atom.io
* Visual Studio Code (Win/Mac/Linux) https://code.visualstudio.com

## Empfehlenswerte Tutorials zum Selbstlernen

* Library Carpentry: https://librarycarpentry.org/lessons/
* Programming Historian: https://programminghistorian.org/en/lessons/
* openHPI: https://open.hpi.de/courses
* Datenschule: https://datenschule.de/lernmaterialien/