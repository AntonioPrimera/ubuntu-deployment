#!/usr/bin/env bash

# Import the utility functions
. functions.sh

# === User Setup ==============================================

info "*** Creating a new user with sudo privileges ***"

username=""
ask "Username: " username
adduser ${username}
usermod -aG sudo ${username}

success "User ${username} is now set up with sudo privileges"

answer="n"
askYN "Do you want to move the setup scripts to the new user's home folder?" answer
if [[ ${answer} = "y" ]]
	then move-to-user-home.sh ${username}
fi