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

# make completion from man
# fish -c 'fish_update_completions'

# apps
apps=(z edc/bass fzf spin humanize_duration)
# install each app 
for app in ${apps[@]}; do
  fish -c "fisher $app"
done
