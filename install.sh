#!/bin/bash

# maintainer: 
#   modsound@gmail.com

DOT_DIR="$HOME/dotfiles"
REPOSITORY="https://github.com/modsound/dotfiles"

# ディレクトリが存在しない場合、作成する
if [ ! -d ${DOT_DIR} ]; then
  mkdir -p ${DOT_DIR}
fi

# gitが実行できる場合、githubからdotfilesをダウンロードする
if type "git"; then
  git clone --recursive ${REPOSITORY} ${DOT_DIR}
else
  echo "[NG] gitコマンドが実行できません。"
  exit 1
fi
