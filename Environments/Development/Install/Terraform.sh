#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
    
wget https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip
unzip terraform_0.11.2_linux_amd64.zip -d /usr/bin