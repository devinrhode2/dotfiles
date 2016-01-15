
# Add postgresql to PATH
# export PATH=/usr/local/opt/postgresql/bin:$PATH

# iirc found this on stackoverflow from a google search possibly including a brew/homebrew keyword
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH

# From Go 1.2/1.3 Install instructions
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting
# export PATH=$PATH:$HOME/.rvm/bin

alias subl='subl -n '
# alias r='rvm 1.9.2 exec ruco'
# alias emacs=/usr/local/Cellar/emacs-mac/emacs-24.4.90-mac-5.4/bin/emacs
# export EDITOR='subl -w '

# php
# load php55
# load_php() {
#   export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
#   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.httpd24.plist
#   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php55.plist
# }

# Lazy Load
# export WORKON_HOME=~/repos/dotfiles/.virtualenvs
# export PROJECT_HOME=$HOME/repos
# source /usr/local/bin/virtualenvwrapper_lazy.sh

# source ~/.rvm/scripts/rvm

# START_PATH_CACHE
# Ideally I'd like to write the use_cached_nvm_bins.sh
# code into this PATH_CACHE block
source ~/.use_cached_nvm_bins.sh
# END_PATH_CACHE



load_nvm() {
  PREV_PATH=$PATH
  source ~/.nvm/nvm.sh
  nvm install 4.2.3
  nvm use 4.2.3
  strindex() { 
    x="${1%%$2*}"
    if [[ $x = $1 ]]; then
      echo "BIG ERROR LOL, nvm.sh apparently removed some PATH segments"
      # could also have an explicit check like this:
      # if !$PATH.contains(PREV_PATH) throw
    else
      i=${#x}
      length=${#PATH}
      bin_path_segment=${PATH:0:$i}
      echo "export PATH=$bin_path_segment\$PATH" > ~/.use_cached_nvm_bins.sh
      echo "writing $bin_path_segment to ~/.use_cached_nvm_bins.sh"
    fi
  }
  strindex "$PATH" "$PREV_PATH"
}

source ~/repos/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi
