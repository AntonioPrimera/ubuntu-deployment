#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === Firewall Setup ==================================================================================================

info "*** Setting up the UFW Firewall ***"

# 1. Allowing OpenSSH through the firewall
ufw allow OpenSSH

# 2. Enabling the firewall
ufw enable

# 3. Check Firewall status
ufw status

success "Firewall is now set up"