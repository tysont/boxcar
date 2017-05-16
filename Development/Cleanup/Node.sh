#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

reactpath="$HOME/Workspaces/react"
mkdir -p "$reactpath"
pushd "$reactpath"
create-react-app my-app
popd