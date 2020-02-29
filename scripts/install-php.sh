#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === PHP 7.2 Installation ============================================================================================

info "Installing PHP..."
sudo apt-get install php7.2-fpm php7.2-common php7.2-json php7.2-mysql php7.2-mbstring php7.2-zip php7.2-xml php7.2-sqlite3 php7.2-bcmath libtidy-dev libtidy5 php-tidy

packageInstallationStatus "php7.2-fpm" "PHP 7.2"


# === Composer Installation ===========================================================================================

# Install Composer if php was successfully installed and if it's not already installed
if [[ $(checkPackageIsInstalled "php7.2-fpm") == "yes" ]]
	then
		if [[ ! -f "/usr/local/bin/composer" ]]
			then
				${DIR}/install-composer.sh
			else
				info "Composer is already installed. No action is necessary. If you want to force re-install composer run: ./scripts/install-composer.sh"
		fi
fi

