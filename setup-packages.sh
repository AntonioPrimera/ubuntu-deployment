#!/usr/bin/env bash

. ./scripts/functions.sh

# === APT-GET Update ==================================================================================================

info "Updating APT - preparing for package installation..."
sudo apt-get update
info "APT-GET was updated"


# === Install NGINX ===================================================================================================

if [[ $(checkPackageIsInstalled "nginx") = "no" ]]
	then
		./scripts/install-nginx.sh
	else
		info "NGINX is already installed. No action is necessary. If you want to force re-installation of nginx run: ./scripts/install-nginx.sh"
fi


# === Install PHP =====================================================================================================

if [[ $(checkPackageIsInstalled "php7.2-fpm") = "no" ]]
	then
		./scripts/install-php.sh
	else
		info "PHP 7.2 is already installed. No action is necessary. If you want to force re-installation of PHP 7.2 run: ./scripts/install-php.sh"
fi


# === Install MYSQL ===================================================================================================

if [[ $(checkPackageIsInstalled "mysql-server") = "no" ]]
	then
		./scripts/install-mysql.sh
	else
		info "MYSQL Server is already installed. No action is necessary. If you want to force re-installation of MYSQL Server run: ./scripts/install-mysql.sh"
fi

# === Install NodeJS ==================================================================================================

if [[ $(checkPackageIsInstalled "nodejs") = "no" ]]
	then
		./scripts/install-nodejs.sh
	else
		info "NodeJs is already installed. No action is necessary. If you want to force re-installation of NodeJs run: ./scripts/install-nodejs.sh"
fi

## === Install Yarn =====================================================================================================
#
#if [[ $(checkPackageIsInstalled "yarn") = "no" ]]
#	then
#		./scripts/install-yarn.sh
#	else
#		info "Yarn is already installed. No action is necessary. If you want to force re-installation of Yarn run: ./scripts/install-yarn.sh"
#fi
