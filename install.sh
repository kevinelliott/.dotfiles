#!/bin/sh
#
# install.sh
#
# Sets up a very opinionated development system and included .dotfiles. This should only
# be run during an initial system setup after a fresh OSX install, and not on a system
# that has already been customized, or it may break some of the packages installed.
#
# Based on https://github.com/afeld/dotfiles/blob/master/init.sh

# Die on failures
set -e

# Echo all commands
# set -x

command_exists () {
  type "$1" &> /dev/null ;
}


script="`python -c 'import os,sys;print os.path.realpath(sys.argv[1])' "$0"`" #"`readlink -f "$0"`"
dir="`dirname "$script"`"


# TODO: Update for my usage
# symlink Sublime Text files
#rm -rf $HOME/Library/Application\ Support/Sublime\ Text\ 2
#ln -s $dir/sublime-text-2 $HOME/Library/Application\ Support/Sublime\ Text\ 2

###########################################################
# Homebrew Managed Software
###########################################################

function install_bottle { 
  if ! command_exists $1; then
    echo "=== Installing $1..."
    brew install $1
    echo "=== $1 installed."
  else
    echo "=== Skipping $1, already installed."
  fi
}

# Install Homebrew itself
if ! command_exists brew; then
  echo "=== Installing Homebrew..."
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
  echo "=== Homebrew installed."
fi
brew -v
sudo chown -R $USER /usr/local/Cellar
brew update
echo "=== Updated homebrew bottles."

# Define bottles to install
bottles=(ack autojump hub memcached tmux)

# Install all bottles
for bottle in "${bottles[@]}"
do
  install_bottle $bottle
done

###########################################################
# Ruby Software
###########################################################

# RVM
if ! command_exists rvm; then
  echo "=== Installing RVM..."
  curl -L https://get.rvm.io | bash -s stable
  echo "=== RVM installed."
  source ~/.bash_profile
fi
rvm -v

# Powify
if ! command_exists powify; then
  echo "=== Installing powify..."
  gem install powify
fi
gem query --local |grep powify


###########################################################
# Configs
###########################################################

# TODO: Make this into a function

# git
ln -s $dir/etc/gitignore_global ~/.gitignore
echo "=== Linked $dir/etc/gitignore_global to ~/.gitignore"
git config --global core.excludesfile ~/.gitignore
echo "=== Configured git's global excludesfile to ~/.gitignore"

# tmux - blatently ripped from https://raw.github.com/chrishunt/dot-files/master/.tmux.conf
ln -s $dir/etc/tmux.conf_global ~/.tmux.conf
echo "=== Linked $dir/etc/tmux.conf_global to ~/.tmux.conf"

# gemrc
ln -s $dir/etc/gemrc_global ~/.gemrc
echo "=== Linked $dir/etc/gemrc_global to ~/.gemrc"

