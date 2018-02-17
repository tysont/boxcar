

scriptpath="/vagrant/Scripts"
loginpath="$scriptpath/Login"
finalizepath="$scriptpath/Finalize"

# if first login
firstFile="$HOME/.first"
if [ ! -f  "$firstFile" ]; then
	for f in $loginpath/*.sh; do
	  echo "Running '$f'."
	  bash "$f" -H   || break
	done

	for f in $finalizepath/*.sh; do
	  echo "Running '$f'."
	  bash "$f" -H   || break
	done  
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

