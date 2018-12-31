#!/usr/bin/env bash

#======================================================================================================================
# The script expects a single argument: the username of the user where to move the scripts
#======================================================================================================================

# Get the full path to the current script
scriptFolder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# The current script is in the "scripts" folder, in the setup folder, so get the full path to the setup folder
setupFolder=$(dirname ${scriptFolder})

# Get the folder name of the setup folder (should be "setup", but it may have changed)
folderName=$(basename ${setupFolder})

mv setupFolder /home/$1/
chown -R $1 /home/$1/$folderName
