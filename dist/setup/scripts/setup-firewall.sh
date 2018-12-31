#!/usr/bin/env bash

. functions.sh

# === Firewall Setup ==========================================

info "*** Setting up the UFW Firewall ***"

# 1. Allowing OpenSSH through the firewall
ufw allow OpenSSH

# 2. Enabling the firewall
ufw enable

# 3. Check Firewall status
ufw status

success "Firewall is now set up"