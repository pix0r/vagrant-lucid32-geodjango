#!/usr/bin/env bash

echo "started at:"; date

# Fix locale issue
sudo echo 'export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8' >> /etc/bash.bashrc

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

sudo apt-get install -y -q binutils gdal-bin libproj-dev postgresql-8.4-postgis postgresql-server-dev-8.4 python-psycopg2 python-setuptools postgresql-contrib

echo "finished at:"; date
echo "Done."

