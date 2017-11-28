# 5.4 Relevanzranking mit TYPO3-find und Solr

TYPO3-find basiert auf dem Suchindex Solr, weshalb für das Relevanzranking die Konfigurationsmöglichkeiten von Solr genutzt werden können. Eine Verbesserung der Relevanzsortierung von Trefferlisten kann in der Praxis bereits durch eine einfache Gewichtung der Felder erzielt werden.

* Relevanz ist abhängig vom Nutzungskontext, d.h. von der Person, die sucht und von ihrem Erkenntnisinteresse zum jeweiligen Zeitpunkt.
* Discovery-Systeme versuchen eine subjektiv als "gut" empfundene Relevanzsortierung durch eine unterschiedliche Gewichtung der verschiedenen Metadatenfelder (Titel, UrheberIn, Beschreibungstext) herzustellen.
* Wenn die Daten uneinheitlich sind (z.B. wenn zu einem Objekt viele und zu einem anderen Objekt sehr wenige beschreibende Daten vorliegen), dann führt dies oft zu unerwarteten Rankings, weil der Suchindex in der Standardkonfiguration das Verhältnis der Suchtreffer in einem Dokument zur Gesamtlänge des Dokuments in die Berechnung der Relevanzsortierung einfließen lässt.
* Weil die Definition eines Algorithmus auf Basis von objektiven Kriterien so schwer fällt, wird in der Praxis die Gewichtung der Felder oft experimentell auf Basis von häufig durchgeführten Suchen austariert. Nutzerstudien sind beim Relevanzranking also besonders wichtig.

## Schritt 1: Parser konfigurieren

Die Suchabfragen werden in Solr durch einen Parser interpretiert. Der voreingestellte Parser erlaubt keine einfache Gewichtung von Feldern, daher nutzen wir den sogenannten "eDismax" Parser. Dieser Parser muss in der Konfiguration von TYPO3-find aktiviert werden. Rufen Sie dazu die TYPO3-Administrationsoberfläche in der virtuellen Maschine auf http://localhost/typo3/ und wählen Sie im Menü List / Seite "Home" das Template "Main TypoScript Rendering". Ersetzen Sie dort den vorhandenen Eintrag im Textfeld Setup durch folgenden Abschnitt und drücken Sie anschließend den Save-Button:

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
                30 {
                        id = date
                        field = date
                        sortOrder = count
                }
        }
        features {
                eDisMax = 1
        }
}
```

## Schritt 2: Relevanzranking einstellen

Im folgenden Befehl sind alle Felder mit Faktor 1 gewichtet. Variieren Sie die Zahlen und entfernen Sie Felder, die Sie aus dem Relevanzranking ausschließen wollen. Prüfen Sie die Ergebnisse im Katalog, machen Sie Beispielsuchen und nähern Sie sich Stück für Stück einem effektiven Relevanzranking an.

Befehl zur Eingabe im Terminal:

```
curl http://localhost:8983/solr/htw/config -H 'Content-type:application/json'  -d '{
  "update-requesthandler": {
    "name": "/select",
    "class":"solr.SearchHandler",
    "defaults":{
      "echoParams":"explicit",
      "rows":"10"
    },
    "appends":{
      "defType":"edismax",
      "qf":"contributor^1 coverage^1 creator^1 date^1 description^1 extent^1 format^1 identifier^1 language^1 pages^1 publisher^1 rights^1 title^1 type^1"
    }
  }
}'
```

## Literatur

* Präsentation von Elmar Haake: Relevanzranking als Erfolgsfaktor für Discoverysysteme. http://docplayer.org/3530893-Relevanzranking-als-erfolgsfaktor-fuer-discoverysysteme-elmar-haake-staats-und-universitaetsbibliothek-bremen.html
* Hajo Seng: Relevance-Ranking auf dem VuFind-Anwendertreffen (siehe die dort verlinkten Papiere und Vortragsfolien). http://beluga-blog.sub.uni-hamburg.de/blog/2015/10/02/relevance-ranking-auf-dem-vufind-anwendertreffen-2015/
* Solr/Lucene Score Tutorial: http://www.openjems.com/solr-lucene-score-tutorial/
* The Extended DisMax Query Parser: https://cwiki.apache.org/confluence/display/solr/The+Extended+DisMax+Query+Parser
