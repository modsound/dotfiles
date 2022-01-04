#!/bin/bash

echo 'シンボリックリンクを作成します'
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotifiles/nvim/plugins.toml ~/.config/nvim/vimrc.d/dein/plugins.toml
ln -sf ~/dotifiles/nvim/plugins.toml ~/.config/nvim/vimrc.d/dein/plugins-lazy.toml
