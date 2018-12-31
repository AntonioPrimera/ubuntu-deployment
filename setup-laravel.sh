#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/scripts/functions.sh"


# === Determine the project folder and the owner ======================================================================

folderName=$1
userName=$2

if [[ ${folderName} = "" ]]
	then
		ask "Project folder name (just the folder name, assumed path: /var/www/): " folderName
fi

if [[ ${userName} = "" ]]
	then
		ask "User name for the owner: " userName
fi

projectPath="/var/www/${folderName}"

# Check that the project folder exists and it looks like a Laravel project
if [[ ! -f "${projectPath}/app/Http/Controllers/Controller.php" ]]
	then
		error "The project at ${projectPath} either does not exist or it doesn't seem to be a Laravel project."
		exit 1
fi

# === Setup the project ===============================================================================================

# Adjust the project ownership
sudo chown -R :www-data "${projectPath}"

# the attributes of the storage and cache folders
sudo chmod -R 775 "${projectPath}/storage"
sudo chmod -R 775 "${projectPath}/bootstrap/cache"

info "The group ownership of the folder was set to 'www-data' and the permissions to the storage and cache folders were adjusted"

# Install dependencies via Composer
cd ${projectPath}
composer install --no-dev

info "Composer installed all dependencies"

# Create the .env file and generate the project key
cp .env.example .env
php artisan key:generate

# Let the user edit the env file
answer="n"
askYN "The .env file was created and the app key was generated. Do you want to edit now the .env file?" answer

if [[ ${answer} = "y" ]]
	then
		sudo nano .env
fi

