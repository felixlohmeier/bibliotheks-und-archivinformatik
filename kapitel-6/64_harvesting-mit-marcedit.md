# 6.4 Harvesting mit MarcEdit

## Z39.50-Schnittstelle abfragen

1. Auf das Zahnrad unten rechts auf der Startseite klicken und den Dialog mit OK bestätigen. Anschließend sollte das Tool Z39.50/SRU Client auf der Startseite von MarcEdit erscheinen.
2. Tool `Z39.50/SRU Client` starten
3. Schnittstelle des NEBIS-Verbunds ergänzen
    * Modify Databases / Add Database / Import from Master List
    * aus der langen Liste NEBIS auswählen (ID: db270)
4. Set Options
    * Limit: 100
    * Save File: `einstein` im Ordner `Downloads`
    * Checkbox `Override local limits` aktivieren
5. Search Mode
    * Search: `albert einstein` (Title)
    * Options: Select database anklicken und NEBIS auswählen
    * Download mit grünem Pfeil starten
    * Mehrfach ganz unten den Link "Get Next 100" anklicken, bis alle Records geladen sind
    * Rechtsklick auf einen Record und Option `Download All Records` wählen.
    
Die Daten sollten jetzt in einer Datei `einstein.mrc` im Ordner `Downloads` liegen.

## Daten in VuFind indexieren

1. Solr starten (nur erforderlich wenn zwischenzeitlich neu gestartet wurde)
    * `/usr/local/vufind/solr.sh start`
2. Import konfigurieren in Datei `/usr/local/vufind/import/marc_local.properties`
    * `collection = Einstein`
    * `institution = NEBIS`
3. Indexierung durchführen
    * `/usr/local/vufind/import-marc.sh ~/Downloads/einstein.mrc`
4. Suchindex optimieren (optional)
    * `php /usr/local/vufind/util/optimize.php`

## Literatur

University Library, University of Illinois at Urbana-Champaign (Hrsg.): Querying Z39.50 Databases. In: LibGuide MarcEdit. An introduction to the MARC record editing software MarcEdit. Stand: 20.10.2017. <http://guides.library.illinois.edu/c.php?g=463460&p=3168074>
