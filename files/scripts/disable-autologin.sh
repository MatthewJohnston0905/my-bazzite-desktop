#!/bin/bash

set -oue pipefail

# Forcefully remove the sddm config file for steamos, ignoring errors if it doesn't exist.
rm -f /etc/sddm.conf.d/steamos.conf

# This is a workaround for running systemctl in a container.
# We create a dummy file for the service so the disable command can succeed.
mkdir -p /etc/systemd/system/multi-user.target.wants/
touch /etc/systemd/system/multi-user.target.wants/bazzite-autologin.service

# Disable the autologin service.
systemctl disable bazzite-autologin.service
