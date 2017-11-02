# 3.6 Bonus: Vergleich mit Crosswalk-Ergebnissen

Wir hätten auch auf den integrierten "Crosswalk" von Swissbib vertrauen und die Daten gleich als Dublin Core herunterladen können. Nach welchen Transformationsregeln hätte Swissbib das dann eigentlich generiert? In [Kapitel 3.2](/3.2) Aufgabe 3 hatten wir das XSL-Stylesheet von Swissbib gefunden: <http://sru.swissbib.ch/sru/xslfiles/MARC21slim2OAIDC.swissbib.xsl>

Versuchen Sie das XSL-Stylesheet zu "lesen", auch wenn Sie die Sprache XSL nicht kennen sollten. Manche Abschnitte sind dank der XML-Struktur mit etwas Puzzelei auch so verständlich.

Folgende Regeln stehen grob darin:

* dc:id aus MARC 001
* dc:creator aus MARC 100, 110, 111, 700, 710, 711, 720
* dc:title aus MARC 245 a,b,f,g,h,k
* dc:type aus MARC 655 und aus leader
* dc:publisher aus MARC 260a und 260b
* dc:date aus MARC 260c
* dc:language aus MARC controlfield 008
* dc:format aus MARC 856q
* dc:description aus MARC 500a bis 599a (ohne 506, 530, 540 und 546)
* dc:subject aus MARC 600, 610, 611, 630, 650, 653, jeweils a,b,c,d,q
* dc:coverage aus MARC 752a, 752b, 752c, 752d
* dc:relation aus MARC 530a, 530b, 530c, 530d, 530u und aus 760, 762, 765, 767, 770, 772-777, 780, 785-787  jeweils o und t
* dc:identifier aus MARC 856u und 020a
* dc:rights aus MARC 506a, 540a

Sie können übrigens ein solches XSL-Stylesheet mit einem XSLT-Prozessor auf der Kommandozeile direkt auf die heruntergeladenen Marc-Daten anwenden

```
mkdir dc/
for i in *.xml; do xsltproc -o dc/$i.xml MARC21slim2OAIDC.swissbib.xsl; done
```

Laden Sie das Transformationsergebnis (Dublin Core als XML) in OpenRefine und vergleichen Sie es mit den MARC-Daten.