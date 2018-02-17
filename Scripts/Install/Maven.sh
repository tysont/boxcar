#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

wget http://apache.mirror.vexxhost.com/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
tar -C /opt -xzf apache-maven-3.5.2-bin.tar.gz
ln -s /opt/apache-maven-3.5.2/bin/mvn /usr/local/bin/mvn