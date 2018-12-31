#!/usr/bin/env bash

#######################################################################################################################
# Set up the git repository and the post-receive hook for a new project
# Expects 2 arguments:
#	$1 - the project folder name
#	$2 - the user name who will own the repository
#######################################################################################################################

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === Git Setup =======================================================================================================

info "Setting up the git repository..."

# Setup the git repository folder
projectName=$1
ownerName=$2
gitFolder="/var/repo/${projectName}.git"
sudo chown -R ${ownerName} ${gitFolder}
sudo git init --bare ${gitFolder}

success "Git folder ${gitFolder} was created"

# Setup the post-receive hook
txt="#!/bin/sh"
echo ${txt} >> ${gitFolder}/hooks/post-receive
txt="git --work-tree=/var/www/${projectName} --git-dir=${gitFolder} checkout -f"
echo ${txt} >> ${gitFolder}/hooks/post-receive

sudo chmod +x ${gitFolder}/hooks/post-receive

success "The post-receive hook was set up in ${gitFolder}/hooks/post-receive"

info "Add this repo to your project remotes: git remote add production ssh://${ownerName}@$(getIp)${gitFolder}"
info "Push to this folder: git push production master"
