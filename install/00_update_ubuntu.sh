#!/usr/bin/env bash
## script for updating Ubuntu
## Example usage:
##   bash 00_update_ubuntu.sh >& 00_update_ubuntu.log

echo "started at:"; date

sudo apt-get update -y -q
sudo apt-get upgrade -y -q

echo "finished at:"; date
echo "Done."

