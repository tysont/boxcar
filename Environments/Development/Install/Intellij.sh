#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

wget https://download.jetbrains.com/idea/ideaIC-2017.1.3-no-jdk.tar.gz
tar -C /opt -xzf ideaIC-2017.1.3-no-jdk.tar.gz
ln -s /opt/idea-IC-171.4424.56/bin/idea.sh /usr/bin/idea