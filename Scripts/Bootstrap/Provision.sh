#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

scriptpath="/vagrant/Scripts"
templatepath="/vagrant/Templates"
preinstallpath="$scriptpath/Preinstall"
installpath="$scriptpath/Install"
logpath="/var/log/provision.log"

exec > >(tee -a "$logpath") 2>&1

echo "Installing desktop environment."
apt-get update

provider="$1"
echo "Installing specific services for provider '$provider'."
if [ "$provider" = "virtualbox" ]; then
  apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
fi

if [ "$provider" = "vmware_fusion" ]; then
  apt-get install -y open-vm-tools open-vm-tools-desktop
fi

echo "Installing software by running pre-installation scripts."
for file in $preinstallpath/*; do
	  echo "Running '$file'."
      [ -f "$file" ] && [ -x "$file" ] && "$file" || true
done

echo "Installing software by running installation scripts."
for file in $installpath/*; do
	  echo "Running '$file'."
      [ -f "$file" ] && [ -x "$file" ] && "$file" || true
done

apt autoremove

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
	cp $templatepath/.profile "$guestHome/.profile"

	mkdir $guestHome/Scripts
	cp $scriptpath/Bootstrap/Authenticate.sh "$guestHome/Scripts"
	cp $scriptpath/Bootstrap/Login.sh "$guestHome/Scripts"

else

	echo "Skipping creating user since username was empty."
fi

gpasswd -d vagrant nopasswdlogin
usermod -a -G nopasswdlogin $guestUsername