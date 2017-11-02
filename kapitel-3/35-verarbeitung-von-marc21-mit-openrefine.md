# 3.5 Verarbeitung von MARC21 mit OpenRefine

Ein möglicher Weg zum Laden von Metadaten in den Suchindex Solr ist die Transformation der bibliothekarischen Metadaten in eine klassische Tabellenstruktur:

* Spaltenüberschriften werden zu Feldern im Suchindex
* Mehrere Werte in einer Tabellenzelle können mit einem Trennzeichen eingegeben werden \(das Trennzeichen muss eindeutig sein, darf also nicht bereits in den Daten vorkommen\)
* OpenRefine bietet als Export vorrangig CSV oder TSV an. Das kann der Suchindex Solr problemlos indexieren.

Nach der Transformation könnten die Daten beispielsweise so aussehen:  


| id | Titel | AutorInnen | ... |
| :--- | :--- | :--- | :--- |
| 123 | Zur Elektrodynamik bewegter Körper | Einstein, Albert | ... |
| 299 | Albert Einstein | Ziegelmann, Horst␟Fischer, Ernst Peter␟Renn, Jürgen | ... |
| ... | ... | ... | ... |

Natürlich könnten wir auch mit einem anderen Werkzeug \(z.B. XSLT\) direkt XML transformieren und anschließend auch direkt als XML indexieren, aber Tabellendaten sind eben einfach besonders übersichtlich und in dieser Struktur fallen Ungereimtheiten in den Daten sofort ins Auge. Für unsere erste Datenquelle im Discovery-System also eine gute Übung.

## Eigenes Schema oder einem Metadatenstandard folgen?

Es ist sicher klar, dass wir nicht die umständlichen MARC-Zahlen und Codes übernehmen wollen, sondern sprechende Namen wie TItel, AutorInnen usw. nutzen wollen. Doch welche Daten brauchen wir genau in welcher Form für den Katalog?

Überlegen Sie:

* Welche Informationen wollen Sie generell in Ihrem Bibliothekskatalog anbieten?
* Wer soll die Hauptzielgruppe sein?
* Welche Filtermöglichkeiten wollen Sie anbieten?
* Welche Kurzinformationen sollen in der Trefferliste stehen?
* Welche Informationen sollen in der Vollanzeige dargestellt werden?

Wenn Sie ein innovatives Discovery-System auf Basis von verschiedenen heterogenen Datenquellen bauen wollen, dann kann auch die absichtliche Reduktion auf wenige Felder helfen \("Simplicity"\). Wichtig für das Nutzererlebnis \("User Experience"\) ist, dass die Felder konsistent belegt sind. Bei der Datentransformation haben Sie die Chance einige Unstimmigkeiten zu bereinigen und Informationen klug zu aggregieren, so dass die Datenquellen vergleichbar durchsuchbar sind.

Haben Sie eigene Vorstellungen? Falls nicht, dann orientieren Sie sich an [Dublin Core](http://dublincore.org/documents/dces/), denn diese Initiative hatte von Beginn an das Ziel, einen gemeinsamen Mindeststandard zu definieren und entsprechend angenehm übersichtlich sind die Felder. Wenn Sie die passenden MARC-Felder nicht kennen, dann folgen Sie einfach der [Empfehlung der Library of Congress für einen MARC to Dublin Core Crosswalk](https://www.loc.gov/marc/marc2dc.html).

## Anleitung zur Transformation von MARC21 mit OpenRefine

### Step 1: Import MARC files

Two options:

* Option 1: Import marcxml (.marcxml, .xml) as XML files
* Option 2: Import binary marc (.mrc) as MARC files

Parsing options for each option:

* Click on ```<record>``` xml element

Columns should look like this:

1. record
2. record - datafield
3. record - datafield - tag
4. record - datafield - ind2
5. record - datafield - ind1
6. record - datafield - subfield
7. record - datafield - subfield - code
8. record - controlfield
9. record - controlfield - tag
10. record - leader

Attention: These column names will be used in the following steps. Rename columns now if they differ from the above list.

### Step 2: Create records

* Select row mode (show as: rows)
* Delete columns "record" and "record - datafield"
* Move column "record - leader" to the beginning

<http://kb.refinepro.com/2012/06/create-records-in-google-refine.html>

### Step 3: Extract data from controlfields

* Transform on column "record - controlfield" ```cells["record - controlfield - tag"].value + "␟" + value```
* Delete column "record - controlfield - tag"
* Join multi-valued cells in column "record - controlfield" with separator ```␞``` (this will delete blank rows too)
* Add column "tmp" based on column "record - leader" with expression ```""```
* Transpose cells across columns from "record - leader" to "tmp" into one column "leader" with fill down in other columns
* Blank down column "record - controlfield"
* Split column "record - controlfield" into several columns by separator ```␞```
* Facet rows without blanks in column "leader" and blank out cells in columns "record - datafield -ind1", "record - datafield -ind2" and "record - datafield - subfield - code"
* Transpose cells across columns from "record - controlfield 1" to "(last column)" into one column "tmp"
* Transform on column "record - datafield - tag" with expression ```cells["tmp"].value.split("␟")[0]```
* Transform on column "record - datafield - subfield" with expression ```cells["tmp"].value.split("␟")[1]```
* Delete column "tmp"

### Step 4: Create index

* Move column "leader" to the end
* Add column "index" based on column "record - datafield - tag" with expression ```forNonBlank(value,v,row.record.index,null)```
* Move column "index" to the beginning

<http://kb.refinepro.com/2012/06/creating-row-and-record-index.html>

### Step 5: Fill down

* Fill down (the safe way) in columns "record - datafield - ind1" and "record - datafield - ind2" with expression ```row.record.cells["record - datafield - ind1"].value[0]``` and ```row.record.cells["record - datafield - ind2"].value[0]``` respectively
* Fill down (the easy way) in column record - datafield - tag
* Move column "leader" to the beginning

<http://kb.refinepro.com/2012/03/fill-down-right-and-secure-way.html>

### Step 6: Statistics

* Text facet on column "record - datafield - tag"
* Try "Blank down" on column "record - datafield - tag" to see how many records include each MARC field
* Rollback with "Fill down" on column "record - datafield - tag" to see total number of MARC fields again

#### Step 7: Create columns

##### A) copy values to new columns

* Select row mode (show as: rows)
* Select values with text facets in "record - datafield - tag" and "record - datafield - subfield - code" (example: tag 100 and codes a, d and q for authors)
* Add column based on column "record - datafield - subfield" with expression ```value```

#### B) transform values in new columns

* Normalize values in new column (e.g. search/replace)
* Add separators (e.g. add brackets to birth dates: select tag 100 / code d and transform new column with expression ```"(" + value + ")"```)

#### C) join values in each new column

* Move column "leader" to the end
* Move column "index" to the beginning
* Join multi-valued cells in new column with separator ``` ``` (space)

#### Step 8: Join records

* Move column "leader" to the beginning
* Join multi-valued cells in each new column with separator ```␟```

#### Step 9: Export

* Use Export / Custom tabular exporter, select relevant columns and download file