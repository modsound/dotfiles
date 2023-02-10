#!/bin/bash

echo $(basename "$0") "を実行します。"

# dein用ディレクトリがなければ作成する
if [! -d $HOME/.config ]; then
  mkdir -p $HOME/.config/nvim/vimrc.d/dein
fi

echo 'シンボリックリンクを作成します。'
ln -sf ~/dotfiles/.bin/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.bin/plugins.toml ~/.config/nvim/vimrc.d/dein/plugins.toml
ln -sf ~/dotfiles/.bin/pluginslazy.toml ~/.config/nvim/vimrc.d/dein/plugins-lazy.toml
