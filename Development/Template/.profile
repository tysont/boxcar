
# if first login
first="$HOME/.first"
if [ ! -f  "$firstFile" ]; then
  run-parts /vagrant/Configure --"regex=[A-Za-z0-9]*.sh"
  run-parts /vagrant/Cleanup --"regex=[A-Za-z0-9]*.sh"
  touch "$firstFile"
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