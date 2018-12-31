#!/usr/bin/env bash
#======================================================================================================================
# This script expects to receive a username as the first argument. It will store all the scripts in the home folder of
# this user, in a folder named "setup"... so for user "antonio" it will store the scripts in /home/antonio/setup
#======================================================================================================================

. ../scripts/functions.sh

# Create the setup folder and the scripts folder inside it
setupFolder="/home/$1/setup"
scriptsFolder="${setupFolder}/scripts"
mkdir -p ${scriptsFolder}

# Download the helper scripts
downloadScript ${scriptsFolder} "scripts/create-user.sh"
downloadScript ${scriptsFolder} "scripts/functions.sh"
downloadScript ${scriptsFolder} "scripts/setup-firewall.sh"

# Download the main scripts and make them executable
downloadScript ${setupFolder} "setup.sh"
sudo chmod +x "${setupFolder}/setup.sh"


#curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/install-all.sh
#curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/project-setup.sh
#curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/setup-laravel.sh

#chmod +x create-user.sh
#sudo chmod +x install-all.sh
#sudo chmod +x project-setup.sh
#sudo chmod +x setup-laravel.sh

#echo "All scripts were downloaded in the ~/setup folder. You can run the following commands to setup the server"
#echo ""
#echo "./install-all.sh - to install nginx, mysql, php (DO NOT RUN AS ROOT!!!)"
#echo "./project-setup.sh - to setup a new project folder and a git repository (DO NOT RUN AS ROOT!!!)"
#echo "./setup-laravel.sh - to setup a laravel project for the first time it was pushed to this server (DO NOT RUN AS ROOT!!!)"