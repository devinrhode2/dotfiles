## INSTALLATION
# Make this your ~/.zshrc file and make sure to do the zgen install steps here:
# https://github.com/tarjoilija/zgen#installation
# You'll also need to change the default shell to zsh: https://github.com/robbyrussell/oh-my-zsh#4-change-your-default-shell

ulimit -n 10240 unlimited

export LT_HOME=/Applications

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

#idk what I'm doing, don't think this is necessary anymore.
reinstall_ember_deps(){
    CURRENT_DIR=pwd
    cd $(npm config get prefix)/lib/node_modules/ember-cli && rm -rf node_modules && npm cache clear && npm install
    cd $CURRENT_DIR
}

export CLOSURE_PATH=/usr/local/Cellar/closure-compiler/20160517/libexec/


# eval $(docker-machine env default)


# redis-server /usr/local/etc/redis.conf
# couchdb
# postgres -D /usr/local/var/postgres
# apachectl start
#
# brew services start redis
# brew services start postgresql
# brew services start couchdb
# brew services restart homebrew/apache/httpd24


#https://www.tensorflow.org/versions/r0.9/get_started/os_setup.html#installation-for-mac-os-x
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"


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
# export EDITOR='vim '

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

# LOAD NVM NORMALLY the default way
export NVM_DIR="/Users/devinrhode2/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

load_nvm() {
  # s o u r c e ~ / . n v m / n v m . s h 
}

# # START_PATH_CACHE
# # Ideally I'd like to write the use_cached_nvm_bins.sh
# # code into this PATH_CACHE block
# source ~/.use_cached_nvm_bins.sh
# # END_PATH_CACHE
# 
# load_nvm() {
#   PREV_PATH=$PATH
#   s o u r c e ~ / . n v m / n v m . s h 
#   strindex() { 
#     x="${1%%$2*}"
#     if [[ $x = $1 ]]; then
#       echo "BIG ERROR LOL, nvm.sh apparently removed some PATH segments"
#       # could also have an explicit check like this:
#       # if !$PATH.contains(PREV_PATH) throw
# 
#     else
#       i=${#x}
#       length=${#PATH}
#       bin_path_segment=${PATH:0:$i}
#       echo "export PATH=$bin_path_segment\$PATH" > ~/.use_cached_nvm_bins.sh
#     fi
#   }
#   strindex "$PATH" "$PREV_PATH"
# }

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



#   brew install gmp gnutls libtasn1 nettle pcre2
# 
# /Users/devinrhode2/.nvm/versions/node/v4.4.5
# 
# 
# ==> Installing railwaycat/emacsmacport/emacs-mac
# 
# ==> Downloading https://bitbucket.org/mituharu/emacs-mac/get/# emacs-24.5-mac-5.17.tar.gz
# 
# ######################################################################## 100.0%
# 
# ######################################################################## 100.0%
# 
# ==> ./autogen.sh
# 
# ==> ./configure --prefix=/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.17 # --enable-locallisppath=/usr/local/share/emacs/site-lisp --infodir=/usr/local/# Cellar
# 
# ==> make
# 
# ==> make install
# 
# Error: The `brew link` step did not complete successfully
# 
# The formula built, but is not symlinked into /usr/local
# 
# Could not symlink bin/emacs
# 
# Target /usr/local/bin/emacs
# 
# already exists. You may want to remove it:
# 
#   rm '/usr/local/bin/emacs'
# 
# 
# 
# To force the link and overwrite all conflicting files:
# 
#   brew link --overwrite emacs-mac
# 
# 
# 
# To list all files that would be deleted:
# 
#   brew link --overwrite --dry-run emacs-mac
# 
# 
# 
# Possible conflicting files are:
# 
# /usr/local/bin/emacs -> /Users/devinrhode2/bin/emacs
# 
# ==> Caveats
# 
# This is YAMAMOTO Mitsuharu's experimental "Mac port" addition to
# 
# GNU Emacs 24. This provides a native GUI support for Mac OS X
# 
# 10.4 - 10.11. After installing, see README-mac and NEWS-mac
# 
# in /usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.17 for the port details.
# 
# 
# 
# Emacs.app was installed to:
# 
#   /usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.17
# 
# 
# 
# To link the application to default Homebrew App location:
# 
#   brew linkapps
# 
# or:
# 
#   ln -s /usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.17/Emacs.app /Applications
# 
# Other ways please refer:
# 
#   https://github.com/railwaycat/homebrew-emacsmacport/wiki/# Alternative-way-of-place-Emacs.app-to-Applications-directory
# 
# 
# 
# For an Emacs.app CLI starter, see:
# 
#   https://gist.github.com/4043945
# 
# 
# 
# .app bundles were installed.
# 
# Run `brew linkapps emacs-mac` to symlink these to /Applications.
# 
# ==> Summary
# 
# 🍺  /usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.17: 3,937 files, 107.5M, built # in 7 minutes 10 seconds
# 
# 
# 
# 
# 
# ==> Installing homebrew/php/php55
# 
# ==> Downloading https://php.net/get/php-5.5.36.tar.bz2/from/this/mirror
# 
# ==> Downloading from https://secure.php.net/distributions/php-5.5.36.tar.bz2
# 
# ######################################################################## 100.0%
# 
# Warning: Backing up all known pear.conf and .pearrc files
# 
# Warning: If you have a pre-existing pear install outside
# 
#          of homebrew-php, or you are using a non-standard
# 
#          pear.conf location, installation may fail.
# 
# ==> ./configure --prefix=/usr/local/Cellar/php55/5.5.36 --localstatedir=/usr/local# /var --sysconfdir=/usr/local/etc/php/5.5 --with-config-file-path=/usr/local/
# 
# Last 15 lines from /Users/devinrhode2/Library/Logs/Homebrew/php55/01.configure:
# 
# checking for Kerberos support... /usr
# 
# checking for krb5-config... /usr/bin/krb5-config
# 
# checking for DSA_get_default_method in -lssl... no
# 
# checking for X509_free in -lcrypto... yes
# 
# checking for RAND_egd... no
# 
# checking for pkg-config... no
# 
# checking for OpenSSL version... >= 0.9.6
# 
# checking for CRYPTO_free in -lcrypto... yes
# 
# checking for SSL_CTX_set_ssl_version in -lssl... yes
# 
# checking for PCRE library to use... bundled
# 
# checking whether to enable the SQLite3 extension... yes
# 
# checking bundled sqlite3 library... yes
# 
# checking for ZLIB support... yes
# 
# checking if the location of ZLIB install directory is defined... no
# 
# configure: error: Cannot find libz
# 
# 
# 
# READ THIS: https://git.io/brew-troubleshooting
# 
# If reporting this issue please do so at (not Homebrew/brew):
# 
#   https://github.com/Homebrew/homebrew-php/issues
# 
# 
# 
# These open issues may also help:
# 
# php55 install php55-pthreads An error https://github.com/Homebrew/homebrew-php/# issues/2505
# 
# OS X 10.11 install to  php55-pthreads installation failed https://github.com/# Homebrew/homebrew-php/issues/2511
# 
# 
# php55 failed to build on 10.11.1 (couldn't understand kern.osversion `15.0.0') # https://github.com/Homebrew/homebrew-php/issues/2513
# 
# 
# 
# 
# 
# 
# 
# ==> Upgrading postgresql
# 
# ==> Downloading https://homebrew.bintray.com/bottles/# postgresql-9.5.3.el_capitan.bottle.tar.gz
# 
# ######################################################################## 100.0%
# 
# ==> Pouring postgresql-9.5.3.el_capitan.bottle.tar.gz
# 
# ==> Caveats
# 
# If builds of PostgreSQL 9 are failing and you have version 8.x installed,
# 
# you may need to remove the previous version first. See:
# 
#   https://github.com/Homebrew/homebrew/issues/2510
# 
# 
# 
# To migrate existing data from a previous major version (pre-9.0) of PostgreSQL, # see:
# 
#   https://www.postgresql.org/docs/9.5/static/upgrading.html
# 
# 
# 
# To migrate existing data from a previous minor version (9.0-9.4) of PosgresSQL, # see:
# 
#   https://www.postgresql.org/docs/9.5/static/pgupgrade.html
# 
# 
# 
#   You will need your previous PostgreSQL installation from brew to perform # `pg_upgrade`.
# 
#   Do not run `brew cleanup postgresql` until you have performed the migration.
# 
# ==> Summary
# 
# 
# 🍺  /usr/local/Cellar/postgresql/9.5.3: 3,142 files, 35.0M
# 
# 
# 
# 
# 
# ==> Installing python3
# 
# Warning: Building python3 from source:
# 
#   The bottle needs the Xcode CLT to be installed.
# 
# ==> Downloading https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tar.xz
# 
# ######################################################################## 100.0%
# 
# ==> Downloading https://bugs.python.org/file40478/xcode-stubs.diff
# 
# ######################################################################## 100.0%
# 
# ==> Patching
# 
# ==> Applying xcode-stubs.diff
# 
# patching file Lib/distutils/ccompiler.py
# 
# patching file Lib/distutils/unixccompiler.py
# 
# ==> ./configure --prefix=/usr/local/Cellar/python3/3.5.1 --enable-ipv6 # --datarootdir=/usr/local/Cellar/python3/3.5.1/share --datadir=/usr/local/Cellar/# python3
# 
# ==> make
# 
# ==> make install PYTHONAPPSDIR=/usr/local/Cellar/python3/3.5.1
# 
# ==> make frameworkinstallextras PYTHONAPPSDIR=/usr/local/Cellar/python3/3.5.1/# share/python3
# 
# ==> Downloading https://pypi.python.org/packages/source/s/setuptools/# setuptools-19.4.tar.gz
# 
# ######################################################################## 100.0%
# 
# ==> Downloading https://pypi.python.org/packages/source/p/pip/pip-8.0.2.tar.gz
# 
# ######################################################################## 100.0%
# 
# ==> Downloading https://pypi.python.org/packages/source/w/wheel/# wheel-0.26.0.tar.gz
# 
# ######################################################################## 100.0%
# 
# ==> /usr/local/Cellar/python3/3.5.1/bin/python3 -s setup.py --no-user-cfg install # --force --verbose --install-scripts=/usr/local/Cellar/python3/3.5.1/bin --in
# 
# ==> /usr/local/Cellar/python3/3.5.1/bin/python3 -s setup.py --no-user-cfg install # --force --verbose --install-scripts=/usr/local/Cellar/python3/3.5.1/bin --in
# 
# ==> /usr/local/Cellar/python3/3.5.1/bin/python3 -s setup.py --no-user-cfg install # --force --verbose --install-scripts=/usr/local/Cellar/python3/3.5.1/bin --in
# 
# ==> Caveats
# 
# Pip and setuptools have been installed. To update them
# 
#   pip3 install --upgrade pip setuptools
# 
# 
# 
# You can install Python packages with
# 
#   pip3 install <package>
# 
# 
# 
# They will install into the site-package directory
# 
#   /usr/local/lib/python3.5/site-packages
# 
# 
# 
# See: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/# Homebrew-and-Python.md
# 
# .app bundles were installed.
# 
# Run `brew linkapps python3` to symlink these to /Applications.
# 
# ==> Summary
# 
# 🍺  /usr/local/Cellar/python3/3.5.1: 7,675 files, 107M, built in 2 minutes 59 seconds