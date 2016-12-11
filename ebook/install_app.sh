login_ssh=docker

mkdir /home/apps/ebook/app/$1
cp -Rf /home/apps/ebook/app/cops/* /home/apps/ebook/app/$1/
chmod -Rf 755 /home/apps/ebook/app
chown -R ${login_ssh}:${login_ssh} /home/apps/ebook/app