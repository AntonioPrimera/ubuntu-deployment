#!/usr/bin/env bash

#======================================================================================================================
# The script expects a single argument: the username of the user where to move the scripts
#======================================================================================================================

# Get the full path to the current script
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

#scriptFolder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# The current script is in the "scripts" folder, in the setup folder, so get the full path to the setup folder
setupFolder=$(dirname ${DIR})
echo "Setup Folder: ${setupFolder}"

# Get the folder name of the setup folder (should be "setup", but it may have changed)
folderName=$(basename ${setupFolder})
echo "Folder Name: ${folderName}"

mv ${setupFolder} /home/$1/
chown -R $1 /home/$1/${folderName}
