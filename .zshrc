
export PATH=/usr/local/opt/postgresql/bin:$PATH

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export subl='subl -w -n '
alias r='rvm 1.9.2 exec ruco'
alias emacs=/usr/local/Cellar/emacs-mac/emacs-24.4-mac-5.2/bin/emacs
export EDITOR='subl -w '

echo "loading virtualenwrapper.."
export WORKON_HOME=~/repos/dotfiles/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

echo "loading rvm.."
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

echo "loading nvm..."
# The addition 'nvm install' attempts in ~/.profile

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh