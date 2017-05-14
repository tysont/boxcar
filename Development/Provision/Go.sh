#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
	
wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
tar -C /opt -xzf go1.8.1.linux-amd64.tar.gz
ln -s /opt/go/bin/* /usr/local/bin