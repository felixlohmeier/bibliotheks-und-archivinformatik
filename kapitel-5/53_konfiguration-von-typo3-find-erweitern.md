# 5.3 Konfiguration von TYPO3-find erweitern

Über das Template im Textfeld ```Setup``` (vgl. den letzten Schritt aus dem vorigen Kapitel) kann TYPO3-find konfiguriert werden.

## Aufgabe: Ergänzen Sie eine weitere Facette

Hinweise:

* Verwenden Sie das Feld ```Datum``` für die Facette

Literatur:

* Dokumentation von TYPO3-find: http://typo3-find.readthedocs.io/en/latest/index.html

## Lösung

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

## Bonus: Darstellung der Trefferliste und Detailseite anpassen

Für die Anpassung der Detailseiten müssen gemäß der Dokumentation von TYPO3-find die Dateien ```Result.html``` und ```Detail.html``` im Ordner ```Resources/Private/Partials/Display/``` der Extension bearbeitet werden.

Die Dateien liegen bei unserer Installation im Ordner ```/var/www/katalog/web/typo3conf/ext/find/Resources/Private/Partials/Display```.
