#!/usr/bin/env bash

# === NGINX ===========================================================================================================

echo "* Installing NGINX"
sudo apt-get update
sudo apt-get install nginx

echo "* Allowing NGINX through the UFW firewall"
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'


# === MYSQL ===========================================================================================================

echo "* Installing MYSQL"
sudo apt-get install mysql-server

echo "* Securing MYSQL Installation (DO NOT ENABLE VALIDATE PASSWORD PLUGIN)"
sudo mysql_secure_installation


# === PHP & Composer ==================================================================================================

echo "* Installing PHP"
sudo apt-get install php7.2-fpm php7.2-common php7.2-json php7.2-mysql php7.2-mbstring php7.2-zip php7.2-xml php7.2-sqlite3

echo "Installing Composer"
echo "1. Downloading Composer"
cd ~
curl -sS https://getcomposer.org/installer | php
echo "2. Moving Composer to /usr/local/bin/"
sudo mv composer.phar /usr/local/bin/composer