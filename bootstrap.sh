#!/usr/bin/env bash

sudo -s

echo '127.0.0.1 ubuntu-xenial' >> /etc/hosts
echo 'export LC_CTYPE=en.US.utf8' >> /home/ubuntu/.bashrc
echo 'export LC_ALL=en_US.utf8' >> /home/ubuntu/.bashrc

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
apt-get --no-install-recommends install -y virtualbox-guest-utils

apt-add-repository ppa:phalcon/stable
apt-get update
apt-get install -y php7.0-phalcon
apt-get install -y php7.0-dev

cd /home/ubuntu/

git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/build
sudo ./install

# time to set phalcon extension from php7
ln -s /etc/php/7.0/mods-available/phalcon.ini /etc/php/7.0/apache2/conf.d/50-phalcon.ini

# enabled rewrite mod
ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf 

# restart webservice
service apache2 restart
