#!/bin/sh

if [ ! -f 00_update_ubuntu.sh ]; then
	echo "NO FILE"
	cd /vagrant/install
fi

pwd

for file in `ls 0*_*.sh | sort -n`; do
	base=`echo $file | sed -e s/.sh//`
	echo "Processing $file"
	bash $file | tee /tmp/install.$base.log
done


