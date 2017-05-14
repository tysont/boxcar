#!/bin/bash

apt-get -y install zsh
sed -i 's|DSHELL=.*$|DSHELL='$(which zsh)'|g' /etc/adduser.conf