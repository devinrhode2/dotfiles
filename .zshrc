
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
source ~/.rvm/scripts/rvm

# START_PATH_CACHE
# Ideally I'd like to write the use_cached_nvm_bins.sh
# code into this PATH_CACHE block
echo "adding node+npm binaries to PATH"
source ~/.use_cached_nvm_bins.sh
# END_PATH_CACHE

load_nvm() {
  PREV_PATH=$PATH
  source ~/.nvm/nvm.sh
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
    fi
  }
  strindex "$PATH" "$PREV_PATH"
}
