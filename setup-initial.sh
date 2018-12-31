#!/usr/bin/env bash

#######################################################################################################################
# This script offers the option to create a new user with sudo privileges and to setup the ufw firewall. This should be
# run by the root as the first thing after creating the VPS instance.
#
# The script accepts 2 optional parameters:
# 	-u / --user : this option tells the script that the user wants to create a new user
#	-f / --firewall : this option tells the script that the user wants to set up the firewall
#
# By default if these options are not provided, the script only provides the option to create a new user and to setup
# the firewall if the current user is the root
#######################################################################################################################

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/scripts/functions.sh"


# === Evaluate the context and the provided options ===================================================================

# If the script is run as root, we ask the user if they want to create a new user and setup the firewall
if [[ $(whoami) = "root" ]]
	then
		setupUser="yes"
		setupFirewall="yes"
	else
		setupUser="no"
		setupFirewall="no"

fi

# If the script is not run as root, specify -u / -user to have the option to create a new user
# and -f / -firewall to have the option to setup the firewall
while [[ "$1" != "" ]]; do
    case $1 in
        -u | --user )  		setupUser="yes"
                                ;;
        -f | --firewall )	setupFirewall="yes"
                                ;;
    esac
    shift
done

# === Run the initial setup (user + firewall) =========================================================================

# Initialize global variables
answer=""

if [[ ${setupFirewall} = "yes" ]]
	then
		askYN "Do you want to setup the UFW firewall?" answer
		if [[ ${answer} = "y" ]]
			# Setup the firewall while we have root privileges
			then ${DIR}/scripts/setup-firewall.sh
		fi
fi

if [[ ${setupUser} = "yes" ]]
	then
		askYN "Do you want to setup a new user?" answer
		if [[ ${answer} = "y" ]]
			then
				# Create a new user and move the setup scripts to the new user's home folder
				${DIR}/scripts/create-user.sh
		fi
fi