#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

apt-get -y install python-pip python-dev build-essential 
pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade --user awscli