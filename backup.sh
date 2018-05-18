#!/bin/bash

# maintainer: 
#   modsound@gmail.com
# abs: 
#   backup config file

# Brewfile
brew bundle dump -f --file=~/dotfiles/Brewfile

# ssh
echo -n "Enter the path to save ssh key: "
read key_path
cp ~/.ssh/* ${key_path
