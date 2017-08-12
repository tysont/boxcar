#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

wget https://download.jetbrains.com/go/gogland-172.3757.46.tar.gz
tar -C /opt -xzf gogland-172.3757.46.tar.gz
ln -s /opt/Gogland-172.3757.46/bin/gogland.sh /usr/bin/gogland


