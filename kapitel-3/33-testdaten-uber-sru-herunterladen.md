# 3.3 Testdaten über SRU herunterladen

Als Testdaten laden wir zunächst alles was der NEBIS-Verbund zum Suchbegriff `Albert Einstein` über alle Felder zu bieten hat \(etwa 2000 Treffer\):

* Suche im Katalog von Swissbib: [https://www.swissbib.ch/Search/Results?lookfor=albert+einstein&type=AllFields&filter%5B%5D=%7Eunion%3A%22NEBIS%22](https://www.swissbib.ch/Search/Results?lookfor=albert+einstein&type=AllFields&filter%5B%5D=%7Eunion%3A%22NEBIS%22)
* Abfrage der SRU-Schnittstelle: [http://sru.swissbib.ch/sru.swissbib.ch/sru/search/defaultdb?query=dc.anywhere+%3D+Albert+Einstein+AND+dc.xNetwork+%3D+NEBIS&operation=searchRetrieve&recordSchema=info%3Asrw%2Fschema%2F1%2Fmarcxml-v1.1-light&maximumRecords=100](http://sru.swissbib.ch/sru.swissbib.ch/sru/search/defaultdb?query=dc.anywhere+%3D+Albert+Einstein+AND+dc.xNetwork+%3D+NEBIS&operation=searchRetrieve&recordSchema=info%3Asrw%2Fschema%2F1%2Fmarcxml-v1.1-light&maximumRecords=100)

Hier ist die Postkarte von Albert Einstein an Alfred Stern aus [Kapitel 2.2](//kapitel-2/22_datenstruktur-von-archivsystemen.md) übrigens nicht dabei. Die Daten aus e-manuscripta.ch laden wir erst später in [Kapitel 6](/kapitel-6.md) als separate Datenquelle.

Die SRU-Schnittstelle lässt maximal 100 Records pro Abfrage zu, d.h. die Daten müssen in Teilen abgefragt werden:

1. `startRecord=0&maximumRecords=100`
2. `startRecord=100& maximumRecords=100`
3. und so weiter...

Um alle Daten herunterzuladen nutzen wir ein vorbereitetes Bash-Script [sru-download.sh](/scripte/sru-download.sh). Shell-Scripte ermöglichen die Automatisierung von Befehlen auf der Kommandozeile. So müssen Sie nicht alle Befehle nacheinander selbst eintippen, sondern brauchen nur einmal das Script starten und der Computer arbeitet die Befehle selbstständig nacheinander ab. Es können auch Variablen und Schleifen definiert werden, so dass die Befehle dynamisch innerhalb der Laufzeit des Scripts angepasst werden können, was sehr weitreichende Möglichkeiten bietet. Shell-Scripte sind somit ein erster Einstieg in die Programmierung, woher übrigens auch das Schimpfwort "[Scriptkiddie](https://de.wikipedia.org/wiki/Scriptkiddie)" stammt ;-\).

Bitte geben Sie die folgenden Befehle in die Kommandozeile ein:

* Script mit `curl` auf den Server laden: `curl -O https://raw.githubusercontent.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/master/scripte/sru-download.sh`
* Script ausführbar machen: `chmod +x sru-download.sh`
* Script starten mit `./sru-download.sh`



