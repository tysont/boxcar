  #!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

mkdir "$HOME/.ssh"
cp "/mnt/home/.ssh/*" "$HOME/.ssh"

chmod 700 "/mnt/home/.ssh"
chmod 600 "/mnt/home/.ssh/id_rsa"
chmod 644 "/mnt/home/.ssh/id_rsa.pub"