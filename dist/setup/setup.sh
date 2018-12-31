#!/usr/bin/env bash

# Run the initial setup (user + firewall) - pass all arguments of the current script to the setup script
setup-initial.sh "$@"

# Install all necessary packages
setup-packages.sh

# Setup a new project if necessary
setup-project.sh

# Setup a Laravel Project
setup-laravel.sh
