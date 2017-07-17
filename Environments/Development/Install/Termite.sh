#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
	
sudo apt-get install -y	g++	libgtk-3-dev gtk-doc-tools gnutls-bin valac	intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"

pushd /opt

git clone https://github.com/thestinger/vte-ng.git
pushd vte-ng && ./autogen.sh && make && sudo make install
popd

git clone --recursive https://github.com/thestinger/termite.git
pushd termite && make && sudo make install
popd

sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
sudo ln -s /opt/termite/termite /usr/bin/termite

popd