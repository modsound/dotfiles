#!/bin/bash

# maintainer: 
#   modsound@gmail.com
# abs: 
#   setup fish config

# set fish prompt
echo "ln to fish_prompt.fish"
ln -snfv ~/dotfiles/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

echo "ln to fish_right_prompt.fish"
ln -snfv ~/dotfiles/fish_right_prompt.fish ~/.config/fish/functions/fish_right_prompt.fish

# set config
echo "ln config file"
ln -snfv ~/dotfiles/config.fish ~/.config/fish/config.fish

# make completion from man
# fish fish_update_completions

# set fish as default shell
echo 'change default shell to fish'
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
