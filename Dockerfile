# Web Apps dans un container
#
# VERSION               0.0.1
#

FROM     fwed/php-zs-project:kaio
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Definition des constantes
ENV login_ssh="docker"

# Ajout du depot pour la cle TellStick
RUN echo 'deb http://download.telldus.com/debian/ stable main' | tee /etc/apt/sources.list.d/telldus.list
RUN wget http://download.telldus.se/debian/telldus-public.key -O- | apt-key add -
RUN apt-get update
RUN apt-get install -y -q telldus-core

# Ajout de la configuration de la cle TellStick 
RUN rm -f /etc/tellstick.conf
COPY domoapi/tellstick.conf /etc/tellstick.conf
RUN chmod -f 664 /etc/tellstick.conf
RUN chown root:plugdev /etc/tellstick.conf

# Installation des paquets
RUN apt-get install -y -q git mediainfo

# Telechargement et installation de DomoApi
COPY domoapi/install.sh /root/install_domoapi.sh
RUN chmod -f 755 /root/install_domoapi.sh
RUN sh /root/install_domoapi.sh

# Modification du sudoers
RUN rm -f /etc/sudoers
COPY domoapi/sudoers /etc/sudoers
RUN chmod -f 440 /etc/sudoers

# Modification de la page d accueil du serveur
RUN rm -f /var/www/html/index.html
COPY domoapi/index.html /var/www/html/index.html
RUN chmod -f 755 /var/www/html/index.html

# Installation de Cops
COPY ebook/install_cops.sh /root/install_cops.sh
RUN chmod -f 755 /root/install_cops.sh
RUN sh /root/install_cops.sh

# Copie du script d'installation de l application de base
COPY ebook/install_app.sh /root/install_app.sh
RUN chmod -f 755 /root/install_app.sh

# Installation de la bibliotheque manga
RUN sh /root/install_app.sh manga
COPY ebook/config_local_manga.php /home/apps/ebook/app/manga/config_local.php
RUN chmod -f 755 /home/apps/ebook/app/manga/config_local.php
COPY ebook/ebook_manga.conf /etc/apache2/sites-enabled/ebook_manga.conf

# Installation de la bibliotheque bd
RUN sh /root/install_app.sh bd
COPY ebook/config_local_bd.php /home/apps/ebook/app/bd/config_local.php
RUN chmod -f 755 /home/apps/ebook/app/bd/config_local.php
COPY ebook/ebook_bd.conf /etc/apache2/sites-enabled/ebook_bd.conf

# Installation de la bibliotheque comics
RUN sh /root/install_app.sh comics
COPY ebook/config_local_comics.php /home/apps/ebook/app/comics/config_local.php
RUN chmod -f 755 /home/apps/ebook/app/comics/config_local.php
COPY ebook/ebook_comics.conf /etc/apache2/sites-enabled/ebook_comics.conf

# Installation de la bibliotheque mag
RUN sh /root/install_app.sh mag
COPY ebook/config_local_mag.php /home/apps/ebook/app/mag/config_local.php
RUN chmod -f 755 /home/apps/ebook/app/mag/config_local.php
COPY ebook/ebook_mag.conf /etc/apache2/sites-enabled/ebook_mag.conf

# Installation de la bibliotheque book
RUN sh /root/install_app.sh book
COPY ebook/config_local_book.php /home/apps/ebook/app/book/config_local.php
RUN chmod -f 755 /home/apps/ebook/app/book/config_local.php
COPY ebook/ebook_book.conf /etc/apache2/sites-enabled/ebook_book.conf

# Modification de services.sh
RUN rm -f /root/services.sh
COPY services.sh /root/services.sh
RUN chmod -f 755 /root/services.sh

# Ports
EXPOSE 9201 9202 9203 9204 9205

# Point de montage
VOLUME ["/home"]
