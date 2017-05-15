#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
	
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8-b132/jdk-8-linux-x64.tar.gz
tar -C /opt -xzf jdk-8-linux-x64.tar.gz
ln -s /opt/jdk1.8.0/bin/* /usr/local/bin