#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

echo "Running provision scripts."

LOGPATH="/var/log/provision.log"
SCRIPTPATH="/vagrant/Provision"

for file in "$SCRIPTPATH/*"; do
    if [ -f "$file" ] && [ -x "$file" ]; then
    	
    	echo "Running provision steps in $file..."
    	echo "Running provision steps in $file..." > $LOGPATH
    	exec $file > $LOGPATH
    	
    fi
done
