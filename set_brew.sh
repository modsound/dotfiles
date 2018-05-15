#!/bin/bash

# maintainer: 
#   modsound@gmail.com
# abs: 
#   install brew related apps
#   need Brewfile in ~/dotfiles/ before you run
# check:
#   run 'brew bundle dump', if you make a list brew apps installed as Brewfile

DOT_DIR="$HOME/dotfiles/"

# install xcode command line tool
xcode-select --install

# install brew
bash /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# check if exists Brewfile
if [ -e ${DOT_DIR}Brewfile ]; then

  cd ${DOT_DIR}
  brew bundle

# if not exists Brewfile
else
  echo "Not found Brewfile"
fi
