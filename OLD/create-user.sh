#!/usr/bin/env bash

# === User Setup ==============================================

echo "* Creating a new user with sudo privileges"
read -p "Username: " username
echo ""
adduser $username
usermod -aG sudo $username

# === Firewall Setup ==========================================

echo "* Setting up the UFW Firewall"

echo "1. Allowing OpenSSH through the firewall"
ufw allow OpenSSH

echo "2. Enabling the firewall"
ufw enable

echo "3. Check Firewall status"
ufw status

