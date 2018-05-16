#!/bin/bash

# maintainer: 
#   modsound@gmail.com
# abs: 
#   setup fish config

# ----------------------------
# set prompt
# ----------------------------

# set fish prompt
echo
echo "[ln]: fish_prompt.fish"
ln -snfv ~/dotfiles/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
echo

echo "[ln]: fish_right_prompt.fish"
ln -snfv ~/dotfiles/fish_right_prompt.fish ~/.config/fish/functions/fish_right_prompt.fish
echo

# ----------------------------
# set user config
# ----------------------------

# set config
echo "[ln]: config.fish"
ln -snfv ~/dotfiles/config.fish ~/.config/fish/config.fish
echo

# ----------------------------
# change default shell to fish
# ----------------------------

cat /etc/shells | while read line; do
  if [ `echo $line | grep /usr/local/bin/fish` ]; then
    # exit loop, if find fish setting in /etc/shells
    exit 1
  fi
done

# exit if return exit 1 above
if [ $? -eq 1 ]; then
  echo "[CHECK]: Maybe already set fish as default shell"
  echo
  exit 1
fi

# set fish as default shell
echo 'change default shell to fish'
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
