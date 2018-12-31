#!/usr/bin/env bash

#######################################################################################################################
# Set up a new site in nginx for a new project
# Expects 1 argument:
#	$1 - the project folder name
#######################################################################################################################

. functions.sh

folderName=$1
createNginxSite ${folderName}
enableNginxSite ${folderName}