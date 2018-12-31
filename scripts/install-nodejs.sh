#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === Install NodeJs ==================================================================================================

curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs

packageInstallationStatus "nodejs" "NodeJs"

# If NodeJs was installed, change the global target folder for NPM
if [[ $(checkPackageIsInstalled "nodejs") = "yes" ]]
	then
		mkdir ~/.npm-global
		npm config set prefix '~/.npm-global'
		echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile
		source ~/.profile

		info "Your NPM Global path was changed to ~/.npm-global for authorization reasons. The path was added via ~/.profile"

		answer="n"
		askYN "Do you want to install Yarn?" answer
		if [[ ${answer} = "y" ]]
			then
				${DIR}/install-yarn.sh
		fi

		askYN "Do you want to install PM2?" answer
		if [[ ${answer} = "y" ]]
			then
				npm install pm2 -g

				success "PM2 was installed."
		fi
fi
