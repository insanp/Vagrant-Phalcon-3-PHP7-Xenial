# Vagrant Phalcon 3 PHP7 Xenial

This repository contains initial setup for compiling phalcon 3 in php7 under ubuntu xenial using vagrant.

The sync folder is by default located at ../data/ with the docroot at ../data/html/.

The bootstrap.sh contains some lines to fix missing attributes in xenial image. Currently, the vagrant setup needs to be run manually two times since it fails to mount properly.

In between each vagrant up, virtual box utility needs to be installed for mounting :

apt-get --no-install-recommends install -y virtualbox-guest-utils
