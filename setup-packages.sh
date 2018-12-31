#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/scripts/functions.sh"


# === APT-GET Update ==================================================================================================

info "Updating APT - preparing for package installation..."
sudo apt-get update
info "APT-GET was updated"


# === Install NGINX ===================================================================================================
answer="n"

if [[ $(checkPackageIsInstalled "nginx") = "no" ]]
	then
		askYN "NGINX is not installed. Do you want to install NGINX?" answer
		if [[ ${answer} = "y" ]]
			then ${DIR}/scripts/install-nginx.sh
		fi
	else
		info "NGINX is already installed. No action is necessary. If you want to force re-installation of nginx run: ./scripts/install-nginx.sh"
fi


# === Install PHP =====================================================================================================

if [[ $(checkPackageIsInstalled "php7.2-fpm") = "no" ]]
	then
		askYN "PHP 7.2 is not installed. Do you want to install PHP 7.2?" answer
		if [[ ${answer} = "y" ]]
			then ${DIR}/scripts/install-php.sh
		fi
	else
		info "PHP 7.2 is already installed. No action is necessary. If you want to force re-installation of PHP 7.2 run: ./scripts/install-php.sh"
fi


# === Install MYSQL ===================================================================================================

if [[ $(checkPackageIsInstalled "mysql-server") = "no" ]]
	then
		askYN "MYSQL Server is not installed. Do you want to install MYSQL Server?" answer
		if [[ ${answer} = "y" ]]
			then ${DIR}/scripts/install-mysql.sh
		fi
	else
		info "MYSQL Server is already installed. No action is necessary. If you want to force re-installation of MYSQL Server run: ./scripts/install-mysql.sh"
fi

# === Install NodeJS ==================================================================================================

if [[ $(checkPackageIsInstalled "nodejs") = "no" ]]
	then
		askYN "NodeJs is not installed. Do you want to install NodeJs?" answer
		if [[ ${answer} = "y" ]]
			then ${DIR}/scripts/install-nodejs.sh
		fi
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
