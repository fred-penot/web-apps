login_user=docker
group_user=docker
cd /home/docker
/usr/local/zend/bin/php -r "file_put_contents('symfony', file_get_contents('https://symfony.com/installer'));"
chmod -f 755 symfony
/usr/local/zend/bin/php symfony new projectSf3
chown -R ${login_user}:${group_user} /home/docker/projectSf3
chmod -Rf 777 /home/docker/projectSf3
ln -s /home/docker/projectSf3 /var/www/html/projectSf3
cd /home/docker/projectSf3
/usr/local/zend/bin/php app/console server:run
chmod -Rf 777 /home/docker/projectSf3
