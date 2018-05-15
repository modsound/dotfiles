#!/bin/bash

# maintainer: 
#   modsound@gmail.com
# abs: 
#   install fisher, its related plugins

# install fisherman (plugin manager)
if [ ! -e ~/.config/fish/functions/fisher.fish ]; then
  echo "install fisherman for the first time"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
else
  echo "Already install fisherman"
fi

