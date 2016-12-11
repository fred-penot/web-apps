cd /var/www/html
git clone https://github.com/fred-penot/DomoApi.git
mv /var/www/html/DomoApi /var/www/html/domoapi
chmod -Rf 777 /var/www/html/domoapi
cd /var/www/html/domoapi
/usr/local/zend/bin/php composer.phar install
rm -f /var/www/html/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/ConsoleServiceProvider.php
cp /var/www/html/domoapi/app/doc/ConsoleServiceProvider.php /var/www/html/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/
cp -Rf /var/www/html/domoapi/app/doc/allocine /var/www/html/domoapi/vendor/
rm -f /var/www/html/domoapi/vendor/composer/autoload_psr4.php
cp /var/www/html/domoapi/app/doc/autoload_psr4.php /var/www/html/domoapi/vendor/composer/
rm -f /var/www/html/domoapi/vendor/phansys/getid3/GetId3/Lib/Helper.php
cp /var/www/html/domoapi/app/doc/Helper.php /var/www/html/domoapi/vendor/phansys/getid3/GetId3/Lib/
rm -f /var/www/html/domoapi/vendor/phansys/getid3/GetId3/GetId3.php
cp /var/www/html/domoapi/app/doc/GetId3.php /var/www/html/domoapi/vendor/phansys/getid3/GetId3/
cd /var/www/html/domoapi/app/doc
unzip DomoApi.sql.zip
unzip HomeOS.sql.zip
rm -f DomoApi.sql.zip
rm -f HomeOS.sql.zip
chmod -Rf 777 /var/www/html/domoapi