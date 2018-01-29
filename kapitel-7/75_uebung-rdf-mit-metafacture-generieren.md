# 7.5 Übung: RDF mit Metafacture generieren

## Vorgehen in der Übung

* ein Marc Record dient als Input
* wir benutzen die vorbereiteten Shellscripte zur Steuerung der Abläufe

## Download der Arbeitsumgebung

Starten Sie ein Terminal und geben Sie die folgenden Befehle ein:

```
wget https://felixlohmeier.de/htw/htwChur.linked.swissbib.tar.gz
tar -xzf htwChur.linked.swissbib.tar.gz
```

## Übung

Folgen Sie der Übung und versuchen Sie anhand der vorhergehenden Einführung in Metafacture die Datentransformation grob nachzuvollziehen.

1. Schauen Sie sich den Ausgangsdatensatz an

```
pluma ~/htwChur.linked.swissbib/machwas/metafacture/data.in/single.record.xml
```

2. Schauen Sie sich die Flux-Konfiguration an

```
pluma ~/htwChur.linked.swissbib/machwas/metafacture/transform2RDF.all.flux
```

3. Schauen Sie sich die Metamorph-Konfiguration an

```
pluma ~/htwChur.linked.swissbib/machwas/metafacture/morph/*.xml
```

4. Starten Sie das vorbereitete Shellscript

```
~/htwChur.linked.swissbib/machwas/metafacture/start.transform2RDF.all.sh
```

5. Öffnen Sie die Ergebnisse in einem Texteditor

```
pluma ~/htwChur.linked.swissbib/machwas/metafacture/data.out/rdfdump_$(date +%Y%m%d)*
```
