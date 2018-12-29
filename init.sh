#!/usr/bin/env bash

mkdir setup
cd setup

#curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/create-user.sh
curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/install-all.sh
curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/project-setup.sh
curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/setup-laravel.sh

chmod +x create-user.sh
chmod +x install-all.sh
chomd +x project-setup.sh
chmod +x setup-laravel.sh

echo "All scripts were downloaded in the ~/setup folder. You can run the following commands to setup the server"
echo ""
echo "./install-all.sh - to install nginx, mysql, php (DO NOT RUN AS ROOT!!!)"
echo "./project-setup.sh - to setup a new project folder and a git repository (DO NOT RUN AS ROOT!!!)"
echo "./setup-laravel.sh - to setup a laravel project for the first time it was pushed to this server (DO NOT RUN AS ROOT!!!)"