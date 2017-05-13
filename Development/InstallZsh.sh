#!/bin/bash

apt-get -y install zsh
sed -i 's|DSHELL=.*$|DSHELL='$(which zsh)'|g' /etc/adduser.conf
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh 
chsh -s $(which zsh)
zsh