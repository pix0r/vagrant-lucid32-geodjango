#!/usr/bin/env bash

echo "started at:"; date

# does this shit work?
#APPEND_LOCALE="LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8"
#export $APPEND_LOCALE

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Rebuild cluster as UTF8
echo "Dropping main cluster"
sudo -E sudo -E -u postgres pg_dropcluster --stop 8.4 main
echo "Creating main cluster as UTF-8"
sudo -E sudo -E -u postgres pg_createcluster --start -e UTF-8 8.4 main

echo "Setting up 'vagrant' user for postgresql"
sudo -E sudo -E -u postgres createuser -s --createdb vagrant

echo "Running postgis config script"
sudo -E sudo -E -u postgres bash geodjango/create_template_postgis-debian.sh

echo "Adding SRID 915 for 2011 TIGER data"
echo "DELETE FROM spatial_ref_sys WHERE srid=915; INSERT into spatial_ref_sys (srid, auth_name, auth_srid, proj4text, srtext) values ( 915, 'sr-org', 15, '+proj=longlat +ellps=GRS80 +datum=NAD83 +no_defs ', 'GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]]');" | psql template_postgis

echo "Setting up PostgreSQL for remote connections"
echo "  (username: vagrant password: vagrant)"
echo "NOTE: Currently you need to MANUALLY set up the password for vagrant user"
echo "E.g.:"
echo "	psql postgres"
echo "	\password vagrant"
echo "
# Auto-generated from 03_configure_postgis.sh at `date`
listen_addresses = '*'
" >> /etc/postgresql/8.4/main/postgresql.conf

echo "
# Auto-generated from 03_configure_postgis.sh at `date`
host all all 33.33.33.0/24 md5
" >> /etc/postgresql/8.4/main/pg_hba.conf

echo "Adding adminpack"
sudo -E sudo -E -u postgres psql < /usr/share/postgresql/8.4/contrib/adminpack.sql

echo "finished at:"; date
echo "Done."

