cd /var/www/html
/usr/local/zend/bin/php -r "file_put_contents('symfony', file_get_contents('https://symfony.com/installer'));"
chmod -f 755 symfony
/usr/local/zend/bin/php symfony new projectSf3
chmod -Rf 777 /var/www/html/projectSf3
cd /var/www/html/projectSf3
/usr/local/zend/bin/php app/console server:run
chmod -Rf 777 /var/www/html/projectSf3
