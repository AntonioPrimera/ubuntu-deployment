#!/usr/bin/env bash

echo "* Setup the project folder"
read -p "Project folder: " foldername
echo ""
read -p "User name: " username
echo ""

sudo chown -R :www-data /var/www/cbtraffic && sudo chmod -R 775 /var/www/cbtraffic/storage && sudo chmod -R 775 /var/www/cbtraffic/bootstrap/cache