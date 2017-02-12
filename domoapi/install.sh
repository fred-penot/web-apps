login_user=docker
group_user=docker

mkdir -p /home/apps
cd /home/apps
git clone https://github.com/fred-penot/DomoApi.git
mv /home/apps/DomoApi /home/apps/domoapi
chmod -Rf 777 /home/apps/domoapi
cd /home/apps/domoapi
/usr/local/zend/bin/php composer.phar install
rm -f /home/apps/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/ConsoleServiceProvider.php
cp /home/apps/domoapi/app/doc/ConsoleServiceProvider.php /home/apps/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/
cp -Rf /home/apps/domoapi/app/doc/allocine /home/apps/domoapi/vendor/
rm -f /home/apps/domoapi/vendor/composer/autoload_psr4.php
cp /home/apps/domoapi/app/doc/autoload_psr4.php /home/apps/domoapi/vendor/composer/
rm -f /home/apps/domoapi/vendor/phansys/getid3/GetId3/Lib/Helper.php
cp /home/apps/domoapi/app/doc/Helper.php /home/apps/domoapi/vendor/phansys/getid3/GetId3/Lib/
rm -f /home/apps/domoapi/vendor/phansys/getid3/GetId3/GetId3.php
cp /home/apps/domoapi/app/doc/GetId3.php /home/apps/domoapi/vendor/phansys/getid3/GetId3/
cd /home/apps/domoapi/app/doc
unzip DomoApi.sql.zip
unzip HomeOS.sql.zip
rm -f DomoApi.sql.zip
rm -f HomeOS.sql.zip
chown -R ${login_user}:${group_user} /home/apps/domoapi
chmod -Rf 777 /home/apps/projectSf3
ln -s /home/apps/domoapi /var/www/html/domoapi
