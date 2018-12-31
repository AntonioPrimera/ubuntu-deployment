#!/usr/bin/env bash

RED='\033[0;31m'
LRED='\033[1;31m'		#LIGHT RED

GREEN='\033[0;32m'
LGREEN='\033[1;32m'		#LIGHT GREEN

ORANGE='\033[0;33m'
YELLOW='\033[1;33m'

BLUE='\033[0;34m'
LBLUE='\033[1;34m'		#LIGHT BLUE

PURPLE='\033[0;35m'
LPURPLE='\033[1;35m'	#LIGHT PURPLE

CYAN='\033[0;36m'
LCYAN='\033[1;36m'		#LIGHT CYAN

BLACK='\033[0;30m'
WHITE='\033[1;37m'

NC='\033[0m' # No Color

info() {
	echo -e "${LBLUE}$1${NC}"
	echo ""
}

success() {
	echo -e "${LGREEN}$1${NC}"
	echo ""
}

error() {
	echo -e "${LRED}$1${NC}"
	echo ""
}

warn() {
	echo -e "${YELLOW}$1${NC}"
	echo ""
}

ask() {
	local answer=""
#	read -p $'\e[1;33m'"$1 "$'\e[0m' answer
#	echo ""
	echo -n -e "${YELLOW}$1 ${NC}"
	read answer
	eval "$2=${answer}"
}

askYN() {
	local _answer=""
#	read -n1 -p $'\e[1;33m'"$1 (y/n)"$'\e[0m' answer
#	echo ""
	echo -n -e "${YELLOW}$1 (y/n) ${NC}"
	read -n1 _answer
	echo ""
	eval "$2=${_answer}"
}

# Provide the target folder as the first argument and the name of the script as the second argument
downloadScript() {
	cd $1
	curl -O "https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/$2"
	cd -
}

# Checks if a package is installed (via apt-get). Expects the name of the package as the single argument.
# The result will be "yes" if the package is installed or "no" otherwise
checkPackageIsInstalled() {
	if [[ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]]
		then echo "no"
		else echo "yes"
	fi
}

# Checks if a package was installed successfully and outputs an information on success or an error on failure
# Expects 2 arguments: $1 - package name (e.g. php7.2-fpm), $2 - readable package name (e.g. PHP)
packageInstallationStatus() {
	if [[ $(checkPackageIsInstalled $1) = "yes" ]]
		then
			success "$2 was successfully installed"
		else
			error "$2 could not be installed. Please try to install it manually."
	fi
}

# Output the current IP
getIp() {
	echo ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}'
}

# Creates a new nginx site
# Expects one argument: the site name (usually the same as the project folder name)
createNginxSite() {
	# Delete the default site
	sudo rm /etc/nginx/sites-enabled/default
	# Copy the default site to the new site
	sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$1
	# Edit the new site
	sudo nano /etc/nginx/sites-available/$1
}

# Enable a new nginx site
# Expects one argument: the site name (usually the same as the project folder name)
enableNginxSite() {
	local enable="n"
	askYN "Do you want to enable the new site?" enable

	if [[ ${enable} = "y" ]]
		then
			sudo ln /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1
			info "Testing the new script:"
			sudo nginx -t

			local restart="n"
			askYN "Do you want to restart nginx for the changes to take effect?" restart
			if [[ ${restart} = "y" ]]
				then
					sudo systemctl reload nginx
					info "The new site is enabled and nginx was restarted. Here's a new nginx config test: "
					sudo nginx -t
			fi
	fi
}

