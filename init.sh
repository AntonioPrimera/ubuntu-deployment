#!/usr/bin/env bash

mkdir setup
cd setup

curl -O https://github.com/AntonioPrimera/ubuntu-deployment/blob/master/create-user.sh
curl -O https://github.com/AntonioPrimera/ubuntu-deployment/blob/master/install-all.sh
curl -O https://github.com/AntonioPrimera/ubuntu-deployment/blob/master/project-setup.sh
curl -O https://github.com/AntonioPrimera/ubuntu-deployment/blob/master/setup-laravel.sh

chmod +x create-user.sh
chmod +x install-all.sh
chomd +x project-setup.sh
chmod +x setup-laravel.sh

echo "Run the following commands to setup the server"
echo ""
echo "./create-user.sh - to create an initial sudo user"
echo "./install-all.sh - to install nginx, mysql, php (DO NOT RUN AS ROOT!!!)"
echo "./project-setup.sh - to setup a new project folder and a git repository (DO NOT RUN AS ROOT!!!)"
echo "./setup-laravel.sh - to setup a laravel project for the first time it was pushed to this server (DO NOT RUN AS ROOT!!!)"