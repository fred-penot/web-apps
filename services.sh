password_mysql=docker
login_ssh=docker
password_ssh=docker

service ssh start
service zend-server start
service mysql start
service telldusd start

# Import des bdd de DomoApi...
if [ -f /var/www/html/domoapi/app/doc/DomoApi.sql ]
then
	mysql -u root -p${password_mysql} < /var/www/html/domoapi/app/doc/DomoApi.sql
	rm -f /var/www/html/domoapi/app/doc/DomoApi.sql
fi

# ... et de HomeOS
if [ -f /var/www/html/domoapi/app/doc/HomeOS.sql ]
then
	mysql -u root -p${password_mysql} < /var/www/html/domoapi/app/doc/HomeOS.sql
	rm -f /var/www/html/domoapi/app/doc/HomeOS.sql
fi

chmod -Rf 777 /var/www/html/domoapi

# Suppresion des fichiers temporaires de DomoApi
rm -Rf /var/www/html/domoapi/app/doc/*
