#!/usr/bin/env bash

# Import the utility functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/functions.sh"

# === User Setup ======================================================================================================

info "Creating the MYSQL Database..."

ask "MYSQL-Server Access User: " mysqlUser
ask "MYSQL-Server Access Password: " mysqlPass
ask "New MYSQL Database Name: " dbName
ask "New MYSQL User Name: " userName
ask "New MYSQL User Password: " userPass

if [[ ${mysqlPass} = "" ]]
	then
		mysql -u${mysqlUser} -e "CREATE DATABASE ${dbName} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
		mysql -u${mysqlUser} -e "CREATE USER ${userName}@localhost IDENTIFIED WITH mysql_native_password BY '${userPass}';"
		#mysql -u${mysqlUser} -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
		mysql -u${mysqlUser} -e "GRANT ALL PRIVILEGES ON ${dbName}.* TO '${userName}'@'localhost';"
		mysql -u${mysqlUser} -e "FLUSH PRIVILEGES;"
	else
		mysql -u${mysqlUser} -p${mysqlPass} -e "CREATE DATABASE ${dbName} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
		mysql -u${mysqlUser} -p${mysqlPass} -e "CREATE USER ${userName}@localhost IDENTIFIED WITH mysql_native_password BY '${userPass}';"
		#mysql -u${mysqlUser} -p${mysqlPass} -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
		mysql -u${mysqlUser} -p${mysqlPass} -e "GRANT ALL PRIVILEGES ON ${dbName}.* TO '${userName}'@'localhost';"
		mysql -u${mysqlUser} -p${mysqlPass} -e "FLUSH PRIVILEGES;"
fi