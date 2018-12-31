#!/usr/bin/env bash

#######################################################################################################################
# Sets up a new remote project:
#	- creates a new project folder in /var/www/
#	- creates a new git repository in /var/repo/ (on request)
#	- creates a new site with NGINX and activates it (on request)
#######################################################################################################################

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/scripts/functions.sh"


# === Project Folder Setup ============================================================================================

answer="n"
askYN "Do you want to create a new project (Folder + Git + Nginx Site)?" answer
if [[ ${answer} = "y" ]]
	then
		info "Setting up the project folder..."

		folderName=""
		userName=""
		ask "Project folder: " foldername
		ask "User name: " username

		sudo mkdir -p /var/www/${folderName}
		sudo chown ${userName} /var/www/${folderName}

		info "Project folder was created in: /var/www/${folderName}"


		# === Setup the project git repository ========================================================================

		askYN "Do you want to setup a new git repository for your project?" answer
		if [[ ${answer} = "y" ]]
			then
				${DIR}/scripts/setup-project-git.sh ${folderName} ${userName}
		fi


		# === NGINX Setup =============================================================================================

		askYN "Do you want to setup a new nginx config file for this project?" answer
		if [[ ${answer} = "y" ]]
			then
				${DIR}/scripts/setup-project-nginx.sh ${folderName}
		fi
fi

