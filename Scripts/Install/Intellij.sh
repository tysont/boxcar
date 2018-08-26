#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

wget https://download.jetbrains.com/idea/ideaIU-2018.2.2-no-jdk.tar.gz
tar -C /opt -xzf ideaIU-2018.2.2-no-jdk.tar.gz
ln -s /opt/idea-IC-173.4548.28/bin/idea.sh /usr/bin/idea