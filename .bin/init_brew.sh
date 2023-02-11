#!/bin/bash

echo $(basename "$0") "を実行します。"

echo "シンボリックリンクを作成します。"
ln -sf ~/dotfiles/.bin/.Brewfile ~/.Brewfile

echo "Brewfileで指定されたプログラムをインストールします。"
brew bundle --global

echo "不要ファイルを削除します。"
brew cleanup
brew cask cleanup
