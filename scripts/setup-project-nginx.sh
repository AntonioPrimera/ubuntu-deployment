#!/usr/bin/env bash

#######################################################################################################################
# Set up a new site in nginx for a new project
# Expects 1 argument:
#	$1 - the project folder name
#######################################################################################################################

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === Setup Nginx Site (wrapper) ======================================================================================

folderName=$1
createNginxSite ${folderName}
enableNginxSite ${folderName}