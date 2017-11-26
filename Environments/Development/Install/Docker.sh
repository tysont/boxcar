#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

apt-get -y remove docker docker-engine docker.io
apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get -y install apt-transport-https ca-certificates software-properties-common 
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
#apt-get -y install docker-ce

wget https://download.docker.com/linux/ubuntu/dists/yakkety/pool/stable/amd64/docker-ce_17.03.2~ce-0~ubuntu-yakkety_amd64.deb
dpkg -i docker-ce_17.03.2_ce-0_ubuntu-yakkety_amd64.deb

apt-get -y install python-pip
pip install docker-compose