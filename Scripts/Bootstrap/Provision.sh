#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

scriptpath="/vagrant/Scripts"
preinstallpath="$scriptpath/Preinstall"
installpath="$scriptpath/Install"
logpath="/var/log/provision.log"

exec > >(tee -a "$logpath") 2>&1

echo "Installing software by running pre-installation scripts."
for f in $preinstallpath/*.sh; do
  echo "Running '$f'."
  bash "$f" -H   || break
done

echo "Installing software by running installation scripts."
for f in $installpath/*.sh; do
  echo "Running '$f'."
  bash "$f" -H   || break
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
	cp $scriptpath/Templates/.profile "$guestHome/.profile"
	cp $scriptpath/Bootstrap/Authenticate.sh "$guestHome/"

else

	echo "Skipping creating user since username was empty."
fi