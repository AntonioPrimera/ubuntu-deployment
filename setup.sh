#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/scripts/functions.sh"

# Run the initial setup (user + firewall) - pass all arguments of the current script to the setup script
#./setup-initial.sh "$@"
${DIR}/setup-initial.sh "$@"

# Install all necessary packages
${DIR}/setup-packages.sh

# Setup a new project if necessary
${DIR}/setup-project.sh

# Setup a Laravel Project
${DIR}/setup-laravel.sh
