#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
	
apt-get -y install zsh
sed -i 's|DSHELL=.*$|DSHELL='$(which zsh)'|g' /etc/adduser.conf