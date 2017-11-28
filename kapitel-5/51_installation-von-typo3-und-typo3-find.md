# 5.1 Installation von TYPO3 und TYPO3-find

Ziel: In diesem Kapitel fügt sich das Puzzle zusammen. Wir haben mit OpenRefine die Daten transformiert und als TSV-Dateien gespeichert. Mit dem Suchindex Solr haben wir die TSV-Dateien indexiert. Nun installieren wir die Katalogoberfläche TYPO3-find, um die Daten aus dem Suchindex auf einer Webseite für die NutzerInnen zur Verfügung zu stellen.

Begriffe:

* TYPO3 ist ein häufig genutztes Content Management System (CMS) für Webseiten
* TYPO3-find ist eine von der SUB Göttingen entwickelte Erweiterung für TYPO3

Für Ubuntu gibt es derzeit kein Installationspaket, daher müssen wir die für TYPO3 benötigten Komponenten (Webserver, Datenbank, PHP) manuell installieren.

## Benötigte Pakete (Apache, MySQL, PHP, Composer) installieren

```
sudo apt-get install apache2 libapache2-mod-php7.0 php7.0 php7.0-mysql mysql-server php-gd php-json php-imagick php-mbstring php-curl php-apcu php-soap php-xml php-zip composer
```

Während der Installation müssen Sie ein Root-Passwort für MySQL vergeben. Denken Sie sich eins aus und notieren Sie dies.

## Konfiguration MySQL

Wenn die Installation abgeschlossen ist, müssen wir eine Datenbank und eine/n Nutzer/in anlegen:
* ```mysql -u root -p```
* MySQL-root-Passwort eingeben
* Anschließend folgende Befehle eingeben (_secretpassword_ durch ein eigenes Passwort ersetzen):
```
CREATE DATABASE typo3 DEFAULT CHARACTER SET utf8;
CREATE USER typo3_db_user@localhost IDENTIFIED BY 'secretpassword';
GRANT ALL PRIVILEGES ON typo3.* TO typo3_db_user@localhost;
FLUSH PRIVILEGES;
quit;
```

## Konfiguration PHP

Optimieren Sie die Einstellungen von PHP für TYPO3:
```
sudo sed -i 's/max_execution_time = 30/max_execution_time = 240/' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/; max_input_vars = 1000/max_input_vars = 1500/' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 8M/' /etc/php/7.0/apache2/php.ini
```

Abschließend ist ein Neustart des Webservers erforderlich:
```
sudo /etc/init.d/apache2 restart
```

## TYPO3 mit Composer installieren

Wir nutzen eine [Distribution von Cedric Ziel](https://github.com/cedricziel/typo3-find-distribution), die TYPO3 und die Erweiterung TYPO3-find beinhaltet. Die Installation erfolgt mit Hilfe des Tools Composer, das wir im ersten Schritt zusammen mit den anderen Paketen installiert haben.

Geben Sie folgende Befehle ins Terminal ein:

```
cd /var/www/
sudo composer create-project cedricziel/typo3-find-distribution katalog dev-master
```

Das Installationsprogramm ```composer``` lädt alle benötigten Programmteile. Die abschließende Abfrage können Sie mit Y oder n beantworten, das ist nicht entscheidend. Nach erfolgter Installation geben Sie folgende weiteren Befehle ins Terminal ein:


```
cd katalog
sudo chown www-data:www-data -R web
sudo touch web/FIRST_INSTALL
sudo sh -c 'echo "<VirtualHost *:80>
        DocumentRoot /var/www/katalog/web
        ServerName katalog
        Options -Indexes
        DirectoryIndex index.php index.html
</VirtualHost>" > /etc/apache2/sites-available/katalog.conf'
sudo a2ensite katalog.conf
sudo a2dissite 000-default.conf
sudo service apache2 reload
```

## Konfiguration von TYPO3 mit dem Installationsassistent

Nach der Installation erreichen Sie TYPO3 unter der Adresse http://localhost. Dort treffen Sie zunächst auf den Installationsassistenten.
* In Schritt 2 muss als Username ```typo3_db_user``` und das von Ihnen für den Nutzer typo3_db_user gesetzte Passwort (secretpassword) eingetragen werden.
* In Schritt 3 wählen Sie die Datenbank ```typo3``` in der Option "use an existing empty database" 
* In Schritt 4 müssen Sie einen weiteren Account anlegen, diesmal für die Administration von TYPO3. Notieren Sie sich Benutzername und Passwort.
* Wählen Sie in Schritt 5 die Option ```Yes, create a base empty page to start from.```
