# 5.5 Suchmaschinenoptimierung

Die Optimierung für Suchmaschinen wie Google oder Bing ist ein großes Geschäft. Regelmäßig werden die Ranking-Algorithmen angepasst und entsprechend häufig und vielfältig sind die auf dem Markt erhältlichen Beratungsangebote. Wer ganz oben im Ranking landen möchte, muss viel Zeit und ggf. auch Geld investieren. Gleichzeitig gibt es ein paar Grundregeln, die schon für eine wesentliche Verbesserung sorgen. Dazu zählt die Beachtung von aktuellen Webstandards, der Optimierung für Mobilgeräte und die intelligente Nutzung von HTML-Metadaten. Das bringt aktuelle Software in der Regel automatisch mit.

Was ist bei Bibliothekskatalogen im Speziellen zu beachten? Hier am Beispiel von VuFind vier grundlegende Punkte:

## 1. Für jeden Datensatz eine Seite

Wer die Katalogeinträge selbst in Suchmaschinen auffindbar machen möchte, muss die Informationen auf Webseiten unter einer permanent verfügbaren URL bereitstellen. Wenn der Suchmaschinenindex neu aufgebaut wird, dann sollte sich diese URL nicht ändern.

Beispiel: Der Eintrag für das Buch "Data science, learning by latent structures, and knowledge discovery" ist bei Swissbib unter folgender URL erreichbar: [https://www.swissbib.ch/Record/339722088](https://www.swissbib.ch/Record/339722088)

VuFind bringt diese URL-Struktur automatisch mit. Ein besseres Ranking würde sich vermutlich noch ergeben, wenn der Titel in der URL selbst vorkommen würde (z.B. so: https://www.swissbib.ch/Record/339722088-data-science-learning-by-latent-structures-and-knowledge-discovery).

Um zu prüfen, ob eine Webseite bereits in den Google-Index aufgenommen wurde, kann eine Suche mit dem Zusatz ```site:domain.com``` erfolgen. Beispiel: ```Data science, learning by latent structures, and knowledge discovery site:swissbib.ch```.

## 2. Anweisungen für Suchmaschinen in der robots.txt

In der Datei robots.txt im Hauptverzeichnis der Domain (Beispiel: [https://www.swissbib.ch/robots.txt](https://www.swissbib.ch/robots.txt)) können Anweisungen für die Suchmaschinen gegeben werden. In der Regel werden hier nur Ausschlüsse definiert, beispielsweise um zu vermeiden, dass Suchmaschinen die Server überlasten.

Siehe auch: [Dokumentation im Handbuch von VuFind zur robots.txt](https://vufind.org/wiki/administration:robots.txt)

## 3. Sitemap erstellen

Suchmaschinen-Crawler folgen in der Regel den Links, die von der Startseite einer Webseite aus gesetzt werden. Ein Suchschlitz wird von den Crawlern in der Regel eher nicht bedient. Daher kann es helfen, wenn eine sogenannte Sitemap mit Links zu allen Unterseiten erstellt wird. VuFind bietet dazu ein eigenes Tool an.

Siehe auch: [Dokumentation im Handbuch von VuFind zur Sitemap](https://vufind.org/wiki/administration:search_engine_optimization)

## 4. Eingebettete Metadaten

In den letzten Jahren hat die herstellerübergreifende Initiative [schema.org](http://schema.org/) einen Standard etabliert, mit dem Inhalte von Webseiten direkt im HTML mit einem Metadaten-Vokabular ausgezeichnet werden kann. Dazu gehören Öffnungszeiten, aber auch Medien wie Bücher, Filme, Musik und so weiter. Die Auszeichnung mit diesen eingebetteten Metadaten kann das Ranking wesentlich verbessern.

Siehe auch: [Dan Scott (30.8.2013): RDFa and schema.org all the library things](https://coffeecode.net/rdfa-and-schemaorg-all-the-library-things.html)
