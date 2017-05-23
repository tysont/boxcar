  #!/bin/bash
if [ "$OSTYPE" = "cygwin" ]; then (set -o igncr) 2>/dev/null && set -o igncr; fi # Cygwin CRLF fix

cp "/mnt/home/.ssh/*" "$HOME/.ssh"
chown "$USERNAME" "$HOME/.ssh/*"

chmod 700 "/mnt/home/.ssh"
chmod 600 "/mnt/home/.ssh/id_rsa"
chmod 644 "/mnt/home/.ssh/id_rsa.pub"