#!/bin/bash

echo $(basename "$0") "を実行します。"

# Finder
echo "隠しファイルを表示します。"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "拡張子を表示します。"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "パスバーを表示します。"
defaults write com.apple.finder ShowPathbar -bool true

echo "タイトルバーにフルパスを表示する。"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "3本指でドラッグできるようにします。"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

echo "NAS等で.DS_Storeを作成しないようにします。"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Dock
echo "Dockを自動で非表示にします。"
defaults write com.apple.dock autohide -bool true

echo "最近使ったアプリケーションを非表示にします。"
defaults write com.apple.dock show-recents -bool false

# SystemUIServer
echo "バッテリーの残量をパーセント表示にします。"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 設定反映
echo "設定を反映します。"
killall Finder
killall Dock
