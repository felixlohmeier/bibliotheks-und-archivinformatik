# 6.3 Installation von MarcEdit

## MarcEdit herunterladen

Für Linux ist derzeit (13.12.2017) nur die etwas ältere Version MarcEdit 6.3.x verfügbar, vgl. <http://marcedit.reeset.net/downloads>.

Installationsdatei herunterladen und entpacken:

```
cd ~
wget http://marcedit.reeset.net/software/marcedit.bin.zip
unzip marcedit.bin.zip
rm -f marcedit.bin.zip
```

## Benötigte Programmbibliotheken installieren

Für die Ausführung von MarcEdit unter Linux werden Programmbibliotheken der Firma Index Data und die Programmumgebung Mono (zur Ausführung von .NET Programmen) benötigt.

```
sudo sh -c 'echo "deb http://ftp.indexdata.dk/ubuntu xenial main deb-src http://ftp.indexdata.dk/ubuntu xenial main" >> /etc/apt/sources.list'
wget http://ftp.indexdata.dk/debian/indexdata.asc
sudo apt-key add indexdata.asc
sudo apt-get update
sudo apt-get install mono-complete zlibc libyaz5 libyaz5-dev
```

## Konfiguration von MarcEdit anpassen

Damit Z39.50 und ähnliche Dienste funktionieren, müssen abschließend noch die Programmbibliotheken in einer Konfigurationsdatei von MarcEdit bekannt gemacht werden:

```
echo '<?xml version="1.0" encoding="utf-8" ?>
<configuration>
   <dllmap dll="yaz4_32.dll" target="libyaz.so.5" />
   <dllmap dll="yaz4_64.dll" target="libyaz.so.5" />
   <dllmap dll="yaz3.dll" target="libyaz.so.5" />
</configuration>' > ~/marcedit/Zoom.Net.YazSharp.dll.config
```

## MarcEdit starten

```
mono ~/marcedit/MarcEdit.exe
```

Beim ersten Start muss dann noch eine Einstellung vorgenommen werden:

* Menü `Locations` Pfad zur Programmbibliothek Mono \(`Mono Path`\) setzen: `/usr/bin/mono`
