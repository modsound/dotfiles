#!/bin/bash

echo $(basename "$0") "を実行します。"

# OSチェック
if [ "$(uname)" != "Darwin" ] ; then
  echo "実行環境がMac OSではありません。"
  exit 1
fi

echo "xcodeをインストールします。"
xcode-select --install > /dev/null

echo "brewをインストールします。"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
