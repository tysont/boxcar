#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

installpath="/vagrant/Install"
logpath="/var/log/provision.log"

exec > >(tee -a "$logpath") 2>&1

provider="$1"
echo "Provisioning for provider '$provider'."

echo "Installing desktop environment."
apt-get update
apt-get install -y xfce4 lightdm lightdm-gtk-greeter xfce4-terminal xfce4-whiskermenu-plugin xfce4-taskmanager

if [ "$provider" = "virtualbox" ]; then
    apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
fi

if [ "$provider" = "vmware_fusion" ]; then
  apt-get install -y open-vm-tools open-vm-tools-desktop
fi

apt-get remove -y --purge xscreensaver
apt-get autoremove -y --purge
service lightdm start
startxfce4&

echo "Installing software by running installation scripts."
run-parts $installpath --regex=[A-Za-z0-9]*.sh