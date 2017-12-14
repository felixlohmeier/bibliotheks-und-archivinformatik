# 6.2 Daten im Format MARC21 indexieren

Wenn Sie mindestens das [Kapitel 3 "Installation von VuFind" des VuFind-Tutorials](https://felixlohmeier.gitbooks.io/vufind-tutorial-de/content/03_Installation_VuFind.html) bearbeitet haben, dann sollte Ihre VuFind-Installation bereit für den Import (weiterer) Daten sein.

Wir laden für diesen Kurs Daten aus Schweizer Bibliotheks- und Archivbeständen.

Direkt in VuFind lassen sich Daten in den Formaten MARC21 (binäres MARC, Dateiendung .mrc) und MARCXML (Dateiendung .marcxml) importieren. Für den Import von Daten in (anderen) XML-Formaten sind größere Anpassungen erforderlich. Wir laden daher in diesem Kapitel zunächst Daten im Format MARC21.

## Rare Books der ETH-Bibliothek

Die ETH-Bibliothek stellt im Rahmen Ihrer Open-Data-Initiative [Downloads ganzer Metadatensets](http://www.library.ethz.ch/en/ms/Open-Data-at-ETH-Library/Downloads), sogenannte "Bulk Data" zur Verfügung. Wir laden das Metadatenset "Rara" (Rare Books).

1. Daten herunterladen
  * `wget download.library.ethz.ch/opendata/eth_rar.marcxml.gz -O ~/Downloads/eth_rar.marcxml.gz`
  * `gunzip ~/Downloads/eth_rar.marcxml.gz`
2. Solr starten (nur erforderlich wenn zwischenzeitlich neu gestartet wurde)
    * `/usr/local/vufind/solr.sh start`
3. Import konfigurieren in Datei `/usr/local/vufind/import/marc_local.properties`
    * `collection = Rare Books`
    * `institution = ETH-Bibliothek`
4. Indexierung durchführen
    * ` /usr/local/vufind/import-marc.sh ~/Downloads/eth_rar.marcxml`
5. Suchindex optimieren (optional)
    * `php /usr/local/vufind/util/optimize.php`
