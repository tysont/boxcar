
# if first login
first="$HOME/.first"
if [ ! -f  "$firstFile" ]; then

  mkdir "/mnt/home/.ssh"
  cp "/mnt/home/.ssh/*" "$HOME/.ssh"
  chown "$USERNAME" "$HOME/.ssh/*"

  chmod 700 "/mnt/home/.ssh"
  chmod 600 "/mnt/home/.ssh/id_rsa"
  chmod 644 "/mnt/home/.ssh/id_rsa.pub"

  run-parts /vagrant/Login --"regex=[A-Za-z0-9]*.sh"
  run-parts /vagrant/Finalize --"regex=[A-Za-z0-9]*.sh"

  touch $firstFile

fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
	. "$HOME/.zshrc"
    fi
fi

# set PATH
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

