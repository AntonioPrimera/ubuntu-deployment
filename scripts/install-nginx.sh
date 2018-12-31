#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"


# === NGINX Installation ==============================================================================================

info "Installing NGINX..."
sudo apt-get install nginx

packageInstallationStatus "nginx" "NGINX"


# === UFW Rules Update for HTTP & HTTPS Traffic =======================================================================

info "Allowing NGINX through the UFW firewall..."

sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'

info "HTTP & HTTPS Traffic is now allowed through the UFW Firewall"
