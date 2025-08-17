#!/bin/bash

# This script is executed during the image build process.

set -oue pipefail

echo "Removing steamos autologin config"
rm /etc/sddm.conf.d/steamos.conf

echo "Disabling bazzite-autologin service"
systemctl disable bazzite-autologin.service

# Optional: To remove the on-screen keyboard from the login screen, remove the '#' from the line below
rm /etc/sddm.conf.d/virtualkbd.conf

# Optional: To enable desktop-mode auto-updates, remove the '#' from the line below
systemctl enable ublue-update.timer
