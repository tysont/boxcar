#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix
	
wget https://download.sublimetext.com/sublime_text_3_build_3126_x64.tar.bz2
tar -C /opt -xjf sublime_text_3_build_3126_x64.tar.bz2
ln -s /opt/sublime_text_3/sublime_text /usr/bin/subl