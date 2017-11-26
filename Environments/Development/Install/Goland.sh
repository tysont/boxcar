#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

wget https://download.jetbrains.com/go/goland-173.3727.96.tar.gz
tar -C /opt -xzf goland-173.3727.96.tar.gz
ln -s /opt/GoLand-173.3727.96/bin/goland.sh /usr/bin/goland
