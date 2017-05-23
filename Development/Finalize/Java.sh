#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

sed -i '1s/^/export JAVA_HOME=\/opt\/jdk1.8.0_131\n\n/' /home/tysont/.zshrc