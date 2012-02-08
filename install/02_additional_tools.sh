#!/usr/bin/env bash

echo "started at:"; date

sudo apt-get install -y git-core unzip
sudo apt-get install -y python-dev python-pip
sudo easy_install virtualenv

echo "finished at:"; date
echo "Done."

