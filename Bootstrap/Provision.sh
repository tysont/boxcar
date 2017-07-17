#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

installpath="/vagrant/Install"
logpath="/var/log/provision.log"

exec > >(tee -a "$logpath") 2>&1

echo "Installing desktop environment."
apt-get update
apt-get install -y xfce4 lightdm lightdm-gtk-greeter xfce4-terminal xfce4-whiskermenu-plugin xfce4-taskmanager

provider="$1"
echo "Installing specific services for provider '$provider'."
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

guestUsername="$2"
guestPassword="$3"

guestHome="$4"
mountHome="$5"

if [ -n "$guestUsername" ]; then

	echo "Creating user '$guestUsername'."
	adduser "$guestUsername" --disabled-password --gecos ",,,"

	if [ -n "$guestPassword" ]; then	

		echo "Setting user password."
		echo "$guestUsername:$guestPassword" | chpasswd

	fi

	adduser "$guestUsername" sudo
	adduser "$guestUsername" docker # Should eventually go elsewhere since this is app specific

	echo "Bootstrapping login configuration and cleanup."
	cp /vagrant/Template/.profile "$guestHome/.profile"

else

	echo "Skipping creating user since username was empty."
fi