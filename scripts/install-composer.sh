#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === Install Composer ================================================================================================

info "Installing Composer..."
cd ~
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

if [[ -f "/usr/local/bin/composer" ]]
        then
        	info "Composer was installed successfully and moved to /usr/local/bin"
        else
        	error "There was an issue with the composer installation. Please try to do it manually."
fi