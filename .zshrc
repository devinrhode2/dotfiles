
# Add postgresql to PATH
export PATH=/usr/local/opt/postgresql/bin:$PATH

# iirc found this on stackoverflow from a google search possibly including a brew/homebrew keyword
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH

# iirc From Go 1.2/1.3 Install instructions
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin

export subl='subl -w -n '
alias r='rvm 1.9.2 exec ruco'
alias emacs=/usr/local/Cellar/emacs-mac/emacs-24.4-mac-5.2/bin/emacs
export EDITOR='subl -w '

# Lazy Load
export WORKON_HOME=~/repos/dotfiles/.virtualenvs
export PROJECT_HOME=$HOME/repos
source /usr/local/bin/virtualenvwrapper_lazy.sh

echo "loading rvm.."
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

echo "loading nvm..."
# The addition 'nvm install' attempts in ~/.profile

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh