login_user=docker
group_user=docker
cd /home/docker
git clone https://github.com/fred-penot/DomoApi.git
mv /home/docker/DomoApi /home/docker/domoapi
chmod -Rf 777 /home/docker/domoapi
cd /home/docker/domoapi
/usr/local/zend/bin/php composer.phar install
rm -f /home/docker/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/ConsoleServiceProvider.php
cp /home/docker/domoapi/app/doc/ConsoleServiceProvider.php /home/docker/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/
cp -Rf /home/docker/domoapi/app/doc/allocine /home/docker/domoapi/vendor/
rm -f /home/docker/domoapi/vendor/composer/autoload_psr4.php
cp /home/docker/domoapi/app/doc/autoload_psr4.php /home/docker/domoapi/vendor/composer/
rm -f /home/docker/domoapi/vendor/phansys/getid3/GetId3/Lib/Helper.php
cp /home/docker/domoapi/app/doc/Helper.php /home/docker/domoapi/vendor/phansys/getid3/GetId3/Lib/
rm -f /home/docker/domoapi/vendor/phansys/getid3/GetId3/GetId3.php
cp /home/docker/domoapi/app/doc/GetId3.php /home/docker/domoapi/vendor/phansys/getid3/GetId3/
cd /home/docker/domoapi/app/doc
unzip DomoApi.sql.zip
unzip HomeOS.sql.zip
rm -f DomoApi.sql.zip
rm -f HomeOS.sql.zip
chown -R ${login_user}:${group_user} /home/docker/domoapi
chmod -Rf 777 /home/docker/projectSf3
ln -s /home/docker/domoapi /var/www/html/domoapi
