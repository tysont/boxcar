#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

wget https://download.jetbrains.com/go/goland-2017.3.2.tar.gz
tar -C /opt -xzf goland-2017.3.2.tar.gz
ln -s /opt/GoLand-2017.3.2/bin/goland.sh /usr/bin/goland
