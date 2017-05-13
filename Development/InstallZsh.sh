 #!/bin/bash

 apt-get -y install zsh
 sed 's|DSHELL=.*$|DSHELL='$(which zsh)'|g' /etc/adduser.conf
 chsh -s $(which zsh)
 sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"