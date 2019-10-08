# VirtualBox Appliance herstellen (Notiz für Lehrende)

Als eine von zwei Optionen wird die Verwendung der Software VirtualBox empfohlen. Den Studierenden wird eine vorkonfigurierte Arbeitsumgebung mit JupyterLab in Form einer Appliance (.ova) bereitgestellt.

Hier wird dokumentiert, wie diese Appliance hergestellt wird.

Die Installation soll funktional gleich zu den für binder verwendeten Dockerfiles sein:

* base-notebook: [Dockerfile für tag 1386e20468](https://github.com/jupyter/docker-stacks/blob/1386e20468332f32a028c6224bbd8439eb406ee4/base-notebook/Dockerfile)
* minimal-notebook: [Dockerfile für tag 1386e20468](https://github.com/jupyter/docker-stacks/blob/1386e20468332f32a028c6224bbd8439eb406ee4/minimal-notebook/Dockerfile)
* eigene Erweiterungen: [Dockerfile](https://github.com/felixlohmeier/bibliotheks-und-archivinformatik/blob/master/binder/Dockerfile)

## Installation

1. Neue Virtuelle Maschine erstellen

   - Name: lubuntu-bain
   - Type: Linux / Ubuntu (64-bit)
   - Memory: 2048 MB
   - Hard Disk: VDI, dynamically allocated, 20 GB

2. VM settings

   - General > Advanced > Shared Clipboard: Bidirectional
   - General > Advanced > Shared Clipboard: user: bain, pass: bain2019
   - System > Processor: 2 CPUs, Enable PAE/NX

3. Installation Lubuntu 18.04

   1. Download der ISO-Datei: http://cdimage.ubuntu.com/lubuntu/releases/18.04.2/release/lubuntu-18.04.3-desktop-amd64.iso
   2. VM starten und heruntergeladene ISO-Datei auswählen
   3. Standardinstallation mit folgenden Parametern:
      - Language: Deutsch
      - Minimale installation
      - Ort: Berlin
      - Name: bain
      - Passwort: bain2019
      - Automatisch anmelden aktivieren

4. Installation Gasterweiterungen

   1. Abhängigkeiten installieren

      ```
      sudo apt update && \
      sudo apt install build-essential dkms linux-headers-$(uname -r)
      ```

   2. VirtualBox Fenstermenü > Devices > Insert Guest Addtions CD image... abbrechen und eingeben:

      ```
      sudo /media/$USER/VBox*/VBoxLinuxAdditions.run
      ```

   3. Nutzer der Gruppe vboxsf hinzufügen (für shared folder)

      ```
      sudo adduser $USER vboxsf
      ```

   4. CD auswerfen im Dateimanager und neustarten

5. Updates installieren und neustarten

   ```
   sudo apt update && \
   sudo apt upgrade && \
   sudo shutdown -r now
   ```

6. Sudo ohne Passwort erlauben

   ```
   sudo echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers
   ```

7. Installation JupyterLab via pip mit jupyter-server-proxy und bash_kernel

   ```
   sudo apt install python3-pip python3-dev && \
   sudo -H pip3 install --upgrade pip && \
   sudo -H pip3 install jupyter && \
   sudo -H pip3 install jupyterlab && \
   sudo -H pip3 install jupyter-server-proxy && \
   sudo -H pip3 install bash_kernel && \
   sudo -H python3 -m bash_kernel.install
   ```

8. Jupyter einmal manuell starten für den Cookie im Browser

   ```
   jupyter notebook
   ```

9. JupyterLab als Systemd Service einrichten

   ```
   echo "[Unit]
   Description=JupyterLab
   [Service]
   User=$USER
   ExecStart=/usr/local/bin/jupyter-lab
   ExecStop=/usr/local/bin/jupyter-notebook stop
   WorkingDirectory=/
   Restart=always
   [Install]
   WantedBy=default.target" | sudo tee /etc/systemd/system/jupyter.service
   sudo systemctl enable jupyter.service
   sudo systemctl start jupyter.service
   ```

10. GitHub Repo clonen

    ```
    sudo apt install git && \
    git clone https://github.com/felixlohmeier/bibliotheks-und-archivinformatik.git
    ```

11. Desktop-Links

    1. Jupyter Notebook

       ```
       echo "[Desktop Entry]
       Encoding=UTF-8
       Name=JupyterLab
       Type=Link
       URL=http://localhost:8888/lab/tree/home/$USER/bibliotheks-und-archivinformatik
       Icon=text-html" >> ~/Desktop/jupyter-notebook
       ```

    2. Gemeinsames Dokument

       ```
       echo "[Desktop Entry]
       Encoding=UTF-8
       Name=Gemeinsames Dokument
       Type=Link
       URL=https://pad.gwdg.de/7X8eCDVoQB2Ng6DZlG40LQ?both
       Icon=text-html" >> ~/Desktop/gemeinsames-dokument
       ```

    3. Ordner

       ```
       ln -s ~/bibliotheks-und-archivinformatik ~/Desktop/bibliotheks-und-archivinformatik
       ```

12. Konfiguration Browser

       - Startseite auf http://localhost:8888/lab/tree/home/bain/bibliotheks-und-archivinformatik setzen

13. Konfiguration Startleiste

       - Leafpad starten und mit rechter Maustaste zum Starter hinzufügen
       - LX-Terminal starten und mit rechter Maus zum Starter hinzufügen

   14. Virtuelle Maschine als Appliance exportieren über Dialog im Menü `Machine` > `Export to OCI`

## Optional: Bootfähige USB-Sticks erstellen (als Alternative zu VirtualBox bei Hardware-Problemen)

Wir nutzen dazu Linux Live Kit: https://www.linux-live.org.

1. Snapshot in VirtualBox erstellen

2. Voraussetzungen installieren: squasfhs und aufs

   ```
   sudo apt install aufs-tools squashfs-tools
   ```

3. Linux Live Kit herunterladen

   ```
   cd /tmp
   git clone https://github.com/Tomas-M/linux-live.git
   cd linux-live
   ```

4. Bei Bedarf Konfiguration in `config` anpassen

5. Dateien generieren

   ```
   sudo ./build
   ```

6. ZIP-Archiv erstellen

   ```
   sudo /tmp/gen_linux_zip.sh
   ```

7. ZIP-Archiv auf USB-Stick entpacken (Unterverzeichnis linux in Hauptverzeichnis!)

8. Auf USB-Stick das Script boot/bootinst.sh ausführen

   ```
   sudo umount /dev/sda1
   mkdir usb
   sudo mount /dev/sda1 usb
   cd usb/linux/boot
   sudo ./bootinst.sh
   ```

9. Datei /linux/boot/syslinux.cfg anpassen

   ```
   UI /linux/boot/vesamenu.c32
   
   TIMEOUT 140
   MENU ROWS 4
   
   MENU CLEAR
   MENU BACKGROUND /linux/boot/bootlogo.png
   
   LABEL default
   MENU LABEL Run Linux (Persistent changes)
   KERNEL /linux/boot/vmlinuz
   APPEND vga=normal initrd=/linux/boot/initrfs.img load_ramdisk=1 prompt_ramdisk=0 nohd rw printk.time=0 consoleblank=0 slax.flags=perch apparmor=0
   
   LABEL default
   MENU LABEL Run Linux (Fresh start)
   KERNEL /linux/boot/vmlinuz
   APPEND vga=normal initrd=/linux/boot/initrfs.img load_ramdisk=1 prompt_ramdisk=0 nohd rw printk.time=0 consoleblank=0 apparmor=0
   
   LABEL default
   MENU LABEL Run Linux (Copy to RAM)
   KERNEL /linux/boot/vmlinuz
   APPEND vga=normal initrd=/linux/boot/initrfs.img load_ramdisk=1 prompt_ramdisk=0 nohd rw printk.time=0 consoleblank=0 slax.flags=toram apparmor=0
   ```

10. Von aktuellem [syslinux](https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/) (tested with syslinux-6.03) Dateien kopieren

    - von efi64/syslinux.efi nach /EFI/boot/bootx64.efi
    - von efi64/com32/elflink/ldlinux/ldlinux.e64 nach /EFI/boot/ldlinux.e64
    - von efi64/com32/menu/menu.c32 nach /EFI/boot/menu.c32
    - von efi64/com32/libutil nach /EFI/boot/libutil.c32

11. Datei /EFI/boot/syslinux.cfg erstellen

    ```
    UI menu.c32
    
    TIMEOUT 40
    
    LABEL default
    MENU LABEL Run Linux (Persistent changes)
    KERNEL /linux/boot/vmlinuz
    APPEND vga=normal initrd=/linux/boot/initrfs.img load_ramdisk=1 prompt_ramdisk=0 nohd rw printk.time=0 consoleblank=0 slax.flags=perch apparmor=0
    
    LABEL default
    MENU LABEL Run Linux (Fresh start)
    KERNEL /linux/boot/vmlinuz
    APPEND vga=normal initrd=/linux/boot/initrfs.img load_ramdisk=1 prompt_ramdisk=0 nohd rw printk.time=0 consoleblank=0 apparmor=0
    
    LABEL default
    MENU LABEL Run Linux (Copy to RAM)
    KERNEL /linux/boot/vmlinuz
    APPEND vga=normal initrd=/linux/boot/initrfs.img load_ramdisk=1 prompt_ramdisk=0 nohd rw printk.time=0 consoleblank=0 slax.flags=toram apparmor=0
    ```

12. Früheren Snapshot in VirtualBox wiederherstellen
