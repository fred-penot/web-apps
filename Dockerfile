# Web Apps dans un container
#
# VERSION               0.0.1
#

FROM     fwed/php-zs-project:kaio
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Definition des constantes
ENV login_ssh="docker"

# Telechargement et installation de symfony 3 + projet de base
COPY install_sf3.sh /root/install_sf3.sh
RUN chmod -f 755 /root/install_sf3.sh
RUN sh /root/install_sf3.sh

# Modification de la page d accueil du serveur
RUN rm -f /var/www/html/index.html
COPY index.html /var/www/html/index.html
RUN chmod -f 755 /var/www/html/index.html

# Modification de services.sh
RUN rm -f /root/services.sh
COPY services.sh /root/services.sh
RUN chmod -f 755 /root/services.sh

# Ports
EXPOSE 9301 8000
