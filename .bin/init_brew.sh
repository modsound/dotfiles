#!/bin/bash

echo $(basename "$0") "を実行します。"

echo "Brewfileで指定されたプログラムをインストールします。"
brew bundle --global
