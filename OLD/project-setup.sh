#!/usr/bin/env bash

# === Project Setup ==============================================

echo "* Setup the project folder"
read -p "Project folder: " foldername
echo ""
read -p "User name: " username
echo ""

sudo mkdir -p /var/www/${foldername}
sudo chown ${username} /var/www/${foldername}

# === Git Setup ==================================================

echo "* Setting up the git repository"

echo "1. Creating and initializing the git repository"
gitFolder="/var/repo/${foldername}.git"
sudo chown -R ${username} ${gitFolder}
sudo git init --bare ${gitFolder}

echo "2. Setting up the post-receive hook"
txt="#!/bin/sh"
echo ${txt} >> ${gitFolder}/hooks/post-receive
txt="git --work-tree=/var/www/${foldername} --git-dir=${gitFolder} checkout -f"
echo ${txt} >> ${gitFolder}/hooks/post-receive

sudo chmod +x ${gitFolder}/hooks/post-receive

echo "Add this repo to your project remotes: git remote add [remote-name] ssh://${username}@[this ip / ssh host]${gitFolder}"
echo "Push to this folder: git push [remote-name] master"

# === NGINX Setup ================================================

enableSite() {
	read -n1 -p "Do you want to enable the new site? (y/n)" enable
	echo ""

	if [ ${enable} = "y" ]
		then
			sudo ln /etc/nginx/sites-available/${foldername} /etc/nginx/sites-enabled/${foldername}
			echo "Testing the new script:"
			sudo nginx -t

			read -n1 -p "Do you want to restart nginx for the changes to take effect? (y/n)" restart
			echo ""
			if [ ${restart} = "y" ]
				then
					sudo systemctl reload nginx
					echo "The new site is enabled and nginx was restarted. Here's a new nginx config test: "
					sudo nginx -t
			fi
	fi
}

setupNginx() {
	sudo rm /etc/nginx/sites-enabled/default
	sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/${foldername}
	sudo nano /etc/nginx/sites-available/${foldername}
}


read -n1 -p "Do you want to setup a new nginx config file for this project? (y/n)" setup
echo ""

if [ ${setup} = "y" ]
	then
		setupNginx;
		enableSite;
fi