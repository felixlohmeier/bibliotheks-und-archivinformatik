## VirtualBox Appliance erstellen

Den Studierenden wird eine vorkonfigurierte Arbeitsumgebung mit JupyterLab in Form einer VirtualBox Appliance (.ova) bereitgestellt. Hier wird dokumentiert, wie diese Appliance hergestellt wird:

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

5. Sudo ohne Passwort erlauben

   ```
   sudo echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers
   ```

6. Updates installieren und neustarten

   ```
   sudo apt update && \
   sudo apt upgrade && \
   sudo shutdown -r now
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

12. Konfiguration Startleiste

       - Leafpad starten und mit rechter Maustaste zum Starter hinzufügen
       - LX-Terminal starten und mit rechter Maus zum Starter hinzufügen

   13. Konfiguration Browser

       - Startseite auf http://localhost:8888/lab/tree/home/bain/bibliotheks-und-archivinformatik setzen

   14. Virtuelle Maschine als Appliance exportieren über Dialog im Menü `Machine` > `Export to OCI`
