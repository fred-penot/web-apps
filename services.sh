password_mysql=docker
login_ssh=docker
password_ssh=docker

service ssh start
service zend-server start
service mysql start
service telldusd start

# Import des bdd de DomoApi...
if [ -f /home/docker/domoapi/app/doc/DomoApi.sql ]
then
	mysql -u root -p${password_mysql} < /home/docker/domoapi/app/doc/DomoApi.sql
	rm -f /home/docker/domoapi/app/doc/DomoApi.sql
fi

# ... et de HomeOS
if [ -f /home/docker/domoapi/app/doc/HomeOS.sql ]
then
	mysql -u root -p${password_mysql} < /home/docker/domoapi/app/doc/HomeOS.sql
	rm -f /home/docker/domoapi/app/doc/HomeOS.sql
fi

chmod -Rf 777 /home/docker/domoapi

# Suppresion des fichiers temporaires de DomoApi
rm -Rf /home/docker/domoapi/app/doc/*
