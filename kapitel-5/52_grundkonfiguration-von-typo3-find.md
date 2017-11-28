# 5.2 Grundkonfiguration von TYPO3-find

Falls der Computer zwischenzeitlich neu gestartet wurde, muss der Suchindex Solr neu gestartet werden:
```
~/solr-7.1.0/bin/solr start
```

Die Administrationsoberfläche von TYPO3 ist unter folgender URL verfügbar: http://localhost/typo3/.

## Menü Extensions

* In der Liste neben dem Eintrag ```Find``` auf den Würfel klicken, um die Extension zu aktivieren

## Menü Page

* Seite ```Home``` auswählen
* Button +Content in Spalte "Normal" drücken und im Reiter ```Plugins``` das Plugin ```TYPO3 Find``` auswählen
* Oben den Save-Button betätigen.

## Menü List

* Gleiche Seite auswählen, auf der vorhin das Plugin eingefügt wurde (müsste noch vorausgewählt sein)
* Das Template ```Main TypoScript Rendering``` bearbeiten
* Reiter ```General```: In Textfeld ```Setup``` den vorhandenen Inhalt durch Folgendes ersetzen
```
page = PAGE
page.100 < styles.content.get
page.javascriptLibs.jQuery = 1
page.includeJS.find = EXT:find/Resources/Public/JavaScript/find.js
plugin.tx_find.features.requireCHashArgumentForActionArguments = 0
plugin.tx_find.settings {
        connections {
                default {
                        options {
                                host = localhost
                                port = 8983
                                path = /solr/htw
                        }
                }
        }
        standardFields {
                title = title
                snippet = creator
        }
        facets {
                10 {
                        id = format
                        field = format
                        sortOrder = count
                }
                20 {
                        id = language
                        field = language
                        sortOrder = count
                }
        }
}
```
* Reiter ```Includes```: Rechts bei ```available items``` das Item ```Find (find)``` anklicken.
* Oben den Save-Button betätigen

Rufen Sie anschließend die Webseite http://localhost auf. Der Katalog sollte erscheinen.

Über das Template im Textfeld ```Setup``` kann TYPO3-find konfiguriert werden. Die Funktionen und Konfigurationsmöglichkeiten sind in der Dokumentation beschrieben: http://typo3-find.readthedocs.io/en/latest/index.html
