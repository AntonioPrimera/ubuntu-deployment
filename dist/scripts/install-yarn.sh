#!/usr/bin/env bash

#######################################################################################################################
# This script installs Yarn Dependency Manager for NodeJs.
#
# Prerequisites:
# 	Yarn will only be installed if NodeJs is already installed on the system. Although Yarn can install NodeJs as part
# 	of its dependencies, this is not what we want.
#
# Arguments:
# 	This script expects no arguments.
#######################################################################################################################

. ./functions.sh

# Check that NodeJs is already installed correctly (prerequisite for Yarn)
if [[ $(checkPackageIsInstalled "nodejs") = "yes" ]]
	then
		# Install Yarn
		curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
		echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
		sudo apt-get update && sudo apt-get install yarn

		success "Yarn was successfully installed."
	else
		error "NodeJs is not installed. Please install NodeJs first, in order to install Yarn."
fi