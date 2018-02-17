#!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

scriptpath="/vagrant/Scripts"
loginpath="$scriptpath/Login"
finalizepath="$scriptpath/Finalize"
	
for file in $loginpath/*; do
  echo "Running '$file'."
  [ -f "$file" ] && [ -x "$file" ] && "$file" || true
done

for file in $finalizepath/*; do
  echo "Running '$file'."
  [ -f "$file" ] && [ -x "$file" ] && "$file" || true
done