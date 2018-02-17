#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
	
apt-get -y install nodejs npm
ln -s $(which nodejs) /usr/bin/node