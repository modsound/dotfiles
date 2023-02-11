#!/bin/bash

echo $(basename "$0") "を実行します。"

echo "iTerm2のplistをPreferencesにコピーします。"
cp -f ~/dotfiles/.bin/com.googlecode.iterm2.plist ~/Library/PreferencePanes
