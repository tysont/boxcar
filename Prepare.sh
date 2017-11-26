#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

rm -rf Build
mkdir Build

cp Vagrantfile Build
cp -r Templates Build
cp -r Bootstrap Build
cp -r Environments/* Build

for directory in Environments/*; do
    if [ -d "$directory" ]; then
    	cp -r $directory/* Build
    fi
done
