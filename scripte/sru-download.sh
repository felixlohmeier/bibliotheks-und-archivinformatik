#!/bin/bash
# Script zum Download von Metadaten über SRU-Schnittstellen mit curl
# sru-download.sh, Felix Lohmeier, v0.3, 01.11.2017
# https://github.com/felixlohmeier/kurs-bibliotheks-und-archivinformatik/

# Variablen (bei Bedarf hier anpassen)
url="sru.swissbib.ch/sru/search/defaultdb"
query="dc.anywhere+%3D+Albert+Einstein+AND+dc.xNetwork+%3D+NEBIS"
format="info%3Asrw%2Fschema%2F1%2Fmarcxml-v1.1-light"
outputdir="download"
filename="einstein-nebis"
recordlimitperquery=100
# Weitere technische Variablen
date="$(date +%F)"
datelog="$(date +%Y%m%d_%H%M%S)"
command="?operation=searchRetrieve"
startrecord=1
let counter=startrecord+recordlimitperquery-1

# Verzeichnis erstellen (falls nicht vorhanden)
mkdir -p $outputdir

# Ausgabe parallel in eine Logdatei schreiben
exec &> >(tee -a "$outputdir/${filename}_${datelog}.log")

# Anzahl der Datensätze auslesen
records=$(curl --silent "${url}${command}&query=${query}&recordSchema=${format}" | sed 's/</\n/g' | sed '/^\//d' | sed 's/:/\n/g' | grep numberOfRecords | cut -c 17-)

# Variablen ausgeben
echo "SRU-Schnittstelle:       ${url}"
echo "Suchabfrage:             ${query}"
echo "Format:                  ${format}"
echo "Anzahl Datensätze:       ${records}"
echo "Datensätze pro Datei:    ${recordlimitperquery}"
echo "Download in Verzeichnis: $(readlink -f ${outputdir})"
echo "Beispiel Dateiname:      ${filename}_${date}_$(printf "%.7i\n" ${startrecord})-$(printf "%.7i\n" ${counter}).xml"
echo "Logdatei:                ${filename}_${datelog}.log"
echo ""

# Startzeitpunkt ausgeben
echo "Startzeitpunkt: $(date)"
echo ""

# Schleife mit Aufruf von curl
while (("$counter" <= "$records")) ; do
    echo "Download Records "${startrecord}" bis "${counter}"..."
    curl "${url}${command}&query=${query}&maximumRecords=${recordlimitperquery}&recordSchema=${format}&startRecord=${startrecord}" > $outputdir/${filename}_${date}_$(printf "%.7i\n" ${startrecord})-$(printf "%.7i\n" ${counter}).xml
    # Sofortige Prüfung des Downloads, wenn Format marcxml
    if [ $format = "marcxml" ]; then
        echo "Ergebnis: "$(grep -c -H '<controlfield tag="001">' $outputdir/${filename}_${date}_$(printf "%.7i\n" ${startrecord})-$(printf "%.7i\n" ${counter}).xml)" records"
    fi
    echo ""
    let counter=counter+recordlimitperquery
    let startrecord=startrecord+recordlimitperquery
done

# Prüfung des Downloads, wenn Format marcxml
if [[ "$format" == *"marcxml"* ]]; then
    echo "Gesamtanzahl der Records im Ordner download:"
    grep '<controlfield tag="001">' $outputdir/*.xml | wc -l
    echo ""
    echo "Dateien, die weniger als 10 Records enthalten:"
    testfiles=($(find "$outputdir" -type f -name '*.xml'))
    for i in "${testfiles[@]}" ; do
        testfilerecords="$(grep -c -h '<controlfield tag="001">' ${i})"
        if (("${testfilerecords}" < "10")); then
            echo 1>&2 "${i}: ${testfilerecords}"
        fi
    done
    echo ""
fi

# Prüfung, ob sich während des Downloads die Datenbank geändert hat
recordsafterdownload=$(curl --silent "${url}${command}&query=${query}&recordSchema=${format}" | sed 's/</\n/g' | sed '/^\//d' | sed 's/:/\n/g' | grep numberOfRecords | cut -c 17-)
if [ "$records" != "$recordsafterdownload" ]; then
    echo 1>&2 "Warnung: Die Suchabfrage an die SRU-Schnittstelle hat vor Beginn des Downloads eine andere Gesamtanzahl an Datensätzen ergeben (${records}) als nach dem Download (${recordsafterdownload}). Das ist ein Indiz dafür, dass die Datenbank zwischenzeitlich verändert wurde. Es ist wahrscheinlich, dass dadurch einzelne Datensätze im Download fehlen."
fi

# Endzeitpunkt ausgeben
echo "Endzeitpunkt: $(date)"
echo ""
