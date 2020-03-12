# Azure Lab einrichten (Hinweis für Lehrende)

Basiert auf: Anleitung von Microsoft zum [Einrichten eines Labs zur Schulung in Shellskripts unter Linux](https://docs.microsoft.com/de-de/azure/lab-services/classroom-labs/class-type-shell-scripting-linux)

## Einrichtung

1. Kostenloses Konto bei Microsoft Azure registrieren (170 € Startguthaben): https://azure.microsoft.com/free/

2. In Azure Portal einloggen und ein neues Lab-Konto einrichten: https://docs.microsoft.com/de-de/azure/lab-services/classroom-labs/tutorial-setup-lab-account
   - Wie im Tutorial beschrieben, muss der eigene Account (oder ein Gastaccount) unter **Access control (IAM)** noch als Rolle "Lab Creator" hinzugefügt werden.
   - Zusätzlich muss unter **Policies > Marketplace Images** das Image "Ubuntu Server 19.10" aktiviert werden

3. Unter https://labs.azure.com anmelden und ein neues Lab erstellen: https://docs.microsoft.com/de-de/azure/lab-services/classroom-labs/tutorial-setup-classroom-lab (Template erstellen dauert ca. 1 Stunde!)
   - Virtual machine (VM) size: `Small` (2 cores, 4GB RAM, $0.20 per hour)
     - Achtung: Labs sind auf 50 cores beschränkt.  Das Template zählt mit, also kann man mit dieser Konfiguration 24 user ausstatten. Wenn man mehr braucht, muss man eine Supportanfrage stellen.
   - VM Image: `Ubuntu Server 19.10`
   - Enable remote desktop connecton: `Enable`
   - username: `bain`
   - password: `bainFS20`
   - quota: `40`

4. Mit dem Template via SSH verbinden und RDP einrichten: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/use-remote-desktop

   - ```
     sudo apt update && sudo apt upgrade
     sudo apt install xfce4 xrdp
     sudo systemctl enable xrdp
     echo xfce4-session >~/.xsession
     sudo service xrdp restart
     ```

5. Sprache einstellen: `sudo dpkg-reconfigure locales`

   - `de_DE.UTF-8 UTF-8` auswählen
   - Keyboard Layout muss nicht separat geändert werden

6. Browser (Firefox) und Texteditor (Mousepad) installieren:  `sudo apt install firefox mousepad`

7. Dock aufräumen

   - Ordner-Symbole links (minimieren) und rechts (Schnellzugriff) entfernen
   - Application Launcher (Lupe) entfernen
   - Launcher / Mousepad ergänzen

## Nutzung

* Die SSH und RDP-Verbindungen zu den VMs laufen auf dynamischen Ports im Bereich 49152-65535. Falls diese im Netzwerk (für die Public IP des Labs) nicht freigegeben werden können, dann muss ein Proxy verwendet werden (siehe unten: "Optional: Guacamole").
* Nutzer\*innen benötigen ein Microsoft-Konto. Die E-Mail-Adresse der Einladung und die E-Mail-Adresse des Microsoft-Kontos müssen übereinstimmen.
* Längere Ladezeiten sind einzuplanen: Das Starten und Stoppen der VMs dauert einige Minuten. Die VMs einzurichten oder zurückzusetzen dauert 1 Stunde!
* Bei der ersten Anmeldung kann ein Passwort vergeben und jederzeit zurückgesetzt werden.
* Die VM kann von den Lehrenden auf den Ausgangszustand (Template) zurückgesetzt werden.
* RDP Clients für Nicht-Windows-Betriebssysteme:
  * MacOS: [Microsoft Remote Desktop 10](https://apps.apple.com/de/app/microsoft-remote-desktop-10/id1295203466)
  * Linux: [Remmina](https://remmina.org/)
* Die öffentliche IP-Adresse des Labs bleibt konstant. Einsehbar über portal.azure.com für die Lab Creator Rolle. Die einzelnen VMs unterscheiden sich nur durch den Port (leider sind diese nur für die Nutzer\*innen einsehbar?).
* In einem Lab kann nur eine VM bereitgestellt werden, also ggf. ein zweites Lab eröffnen. Alternativ kann das Template verändert und dann erneut veröffentlicht werden, was jedoch alle vorhandenen VMs mit dem neuen Template überschreibt.

## Optional: Guacamole

Basiert auf https://fortynorthsecurity.com/blog/apache-guacamole-how-to-install-and-configure/

1. Webserver mit Debian 9.x einrichten
2. Apache Guacamole installieren mit `apt install guacamole-tomcat`
3. Verbindungen einrichten in `/etc/guacamole/user-mapping.xml`
4. Nutzer\*innen können sich dann unter http://localhost:8080/guacamole mit ihren Zugangsdaten anmelden.
