login_ssh=docker

mkdir -p /home/apps/ebook/catalog
mkdir -p /home/apps/ebook/app
cd /home/apps/ebook/app
git clone https://github.com/seblucas/cops.git
chmod -Rf 777 /home/apps/ebook/app/cops
chown -R ${login_ssh}:${login_ssh} /home/apps/ebook/app/cops
chmod -Rf 777 /home/apps/ebook/catalog
chown -R ${login_ssh}:${login_ssh} /home/apps/ebook/catalog