#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

sed -i '1s/^/export M2_HOME=\/opt/apache-maven-3.5.0\n\n/' /home/tysont/.zshrc
sed -i '1s/^/export MAVEN_HOME=\/opt/apache-maven-3.5.0\n/' /home/tysont/.zshrc