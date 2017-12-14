# 6.3 Harvesting mit MarcEdit

## Z39.50-Schnittstelle abfragen

* Auf das Zahnrad unten rechts auf der Startseite klicken und den Dialog mit OK bestätigen. Anschließend sollte das Tool Z39.50/SRU Client auf der Startseite von MarcEdit erscheinen.
* Tool Z39.50/SRU Client starten
* Schnittstelle des NEBIS-Verbunds ergänzen
    * Modify Databases / Add Database / Import from Master List
    * aus der langen Liste NEBIS auswählen (ID: db270)
* Set Options
    * Limit: 100
    * Save File: `einstein` im Ordner Downloads
    * Checkbox `Override local limits` aktivieren
* Search Mode
    * Search: `albert einstein` (Title)
    * Options: Select database anklicken und NEBIS auswählen
    * Download mit grünem Pfeil starten
    * Mehrfach ganz unten den Link "Get Next 100" anklicken, bis alle Records geladen sind
    * Rechtsklick auf einen Record und Option `Download All Records` wählen.
    
Die Daten sollten jetzt in einer Datei einstein.mrc im Ordner Downloads liegen.

## Daten in VuFind indexieren

(folgt)

## Literatur

University Library, University of Illinois at Urbana-Champaign (Hrsg.): Querying Z39.50 Databases. In: LibGuide MarcEdit. An introduction to the MARC record editing software MarcEdit. Stand: 20.10.2017. <http://guides.library.illinois.edu/c.php?g=463460&p=3168074>

University Library, University of Illinois at Urbana-Champaign (Hrsg.): Harvest OAI Records. In: LibGuide MarcEdit. An introduction to the MARC record editing software MarcEdit. Stand: 20.10.2017. <http://guides.library.illinois.edu/c.php?g=463460&p=3168068>