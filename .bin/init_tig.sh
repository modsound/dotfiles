#!/bin/bash

echo $(basename "$0") "を実行します。"

echo 'シンボリックリンクを作成します。'
ln -sf ~/dotfiles/tig/.tigrc ~/.tigrc
