## Bootfähige USB-Sticks erstellen

Als Alternative zu VirtualBox bei Hardware-Problemen.

Wir nutzen das Tool [mkusb](https://help.ubuntu.com/community/mkusb), um USB-Sticks zu erstellen, die mit BIOS und UEFI (inkl. Secure Boot) bootbar sind. Es werden USB-Sticks mit USB 3.0, schneller Schreibgeschwindigkeit und mindestens 16 GB Speicherplatz benötigt. Im Kurs wurde verwendet: [Sandisk Ultra Fit 32GB](https://www.idealo.de/preisvergleich/OffersOfProduct/4524027_-ultra-fit-32gb-sandisk.html).

1. Als erstes wird ein bootbarer Ubuntu USB stick benötigt. Folgen Sie der offiziellen Anleitung

   - Windows: https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-windows
   - macOS: https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-macos
   - Linux: https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu

2. Booten Sie vom USB-Stick und installieren Sie mkusb

   ```
   sudo add-apt-repository universe  # only for standard Ubuntu
   sudo add-apt-repository ppa:mkusb/ppa  # and press Enter
   sudo apt-get update
   sudo apt-get install mkusb mkusb-nox usb-pack-efi
   ```

3. Zweiten USB-Stick einstecken und mkusb starten

   - Option `Install` / `Persistent Live` wählen
   - Einstellung `msdos` auswählen

4. Herunterfahren, ersten USB-Stick entfernen und vom verbliebenen (zweiten) USB-Stick im Modus Run Lubuntu - persistent live" booten

   1. Tastatur einstellen

      - System Tools > Fcitx starten.
      - Unten rechts erscheint ein Tastatur-Icon. Dort `configure` aufrufen.
      - Bei Available Input Method `German` > `Keyboard - German` auswählen und Button Pfeil nach rechts anklicken. Dann `Keyboard - English (US)` rechts anklicken und Button Pfeil nach links anklicken.

   2. Spracheinstellungen

      - Preferences > Language Support starten.
      - Tab `Language`
        - Deutsch (Deutschland) vor English schieben
        - System der Tastatureingabemethode: `fcitx`
        - Button `Apply System-Wide` drücken
      - Tab `Regional Formats` 
        - Deutsch (Deutschland) auswählen
        - Button  `Apply System-Wide` drücken

   3. Zeiteinstellungen:

      - System Tools > Time and Date starten
      - Time Zone: `Europe/Berlin` auswählen

   4. Neustarten und beim anschließenden Dialog `Namen aktualisieren` wählen.

   5. Internetverbindung herstellen über Network Manager Icon unten rechts

   6. Systemupdates

      ```
      sudo apt update && sudo apt upgrade
      ```

5. Neustarten, wieder im Modus "Run Lubuntu - persistent live" booten und dann Schritte 7-12 aus der obigen Anleitung zu VirtualBox ausführen

6. Konfiguration Browser

   - Startseite auf http://localhost:8888/lab/tree/home/lubuntu/bibliotheks-und-archivinformatik setzen

7. Passwörter löschen (z.B. WLAN-Passwort)

8. Im Modus "Try Lubuntu without installing" booten

   1. Datei `media/lubuntu/usbboot/boot/grub` bearbeiten

      1. Menüeintrag `Try Lubuntu without installing` umbenennen in `Run Lubuntu - without changes (backup & restore)`
      2. Die beiden Menüeinträge für Installation entfernen

   2. Backup erstellen

      ```
      cd /media/lubuntu/usbdata
      bash backup
      ```

Bei Bedarf können Backups auf die gleiche Weise wiederhergestellt werden (mit `bash restore`). Die Partition `usbdata` ist in anderen Betriebssystemen lesbar (NTFS), so dass die Backups auch anderswo gespeichert werden können.

Zur Vervielfältigung der USB-Sticks bietet sich ein Disk Utility an, unter Gnome beispielsweise "Disks". Damit lässt sich ein Image erstellen und anschließend auf weitere USB-Sticks aufspielen.