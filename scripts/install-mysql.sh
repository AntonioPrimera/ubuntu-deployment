#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"


# === MYSQL ===========================================================================================================

info "Installing MYSQL..."
sudo apt-get install mysql-server

packageInstallationStatus "mysql-server" "MYSQL Server"

if [[ $(checkPackageIsInstalled "mysql-server") == "yes" ]]
	then
		info "Securing MYSQL Installation..."
		warn "DO NOT ENABLE VALIDATE PASSWORD PLUGIN !!!"
		sudo mysql_secure_installation
fi