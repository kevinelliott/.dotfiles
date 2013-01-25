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

# symlink dotfiles/folders
#find "$dir" -maxdepth 1 | while read file; do
#
#  case "$file" in
#    "$dir"|"$dir/.git"|"$dir/.gitignore"|"$dir/README.markdown"|*.swp|"$script")
#      continue
#      ;;
#  esac
#  
#  name=".`basename $file`"
#  rm -rf "$HOME/$name"
#  ln -s "$file" "$HOME/$name"
#done


# symlink Sublime Text files
#rm -rf $HOME/Library/Application\ Support/Sublime\ Text\ 2
#ln -s $dir/sublime-text-2 $HOME/Library/Application\ Support/Sublime\ Text\ 2

# Git
git config --global core.excludesfile ~/.dotfiles/etc/gitignore_global

# Homebrew
if ! command_exists brew; then
  echo "=== Installing Homebrew..."
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
  echo "=== Homebrew installed."
fi
brew -v
sudo chown -R $USER /usr/local/Cellar
brew update


# ack
if ! command_exists ack; then
  echo "=== Installing ack..."
  brew install ack
  echo "=== ack installed."
fi


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

# autojump
if ! command_exists autojump; then
  echo "=== Installing autojump..."
  brew install autojump
fi
