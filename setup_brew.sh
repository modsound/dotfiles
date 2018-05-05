#!/bin/sh

# install brew
bash /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# set cask
brew tap caskroom/cask

# -----------------------------------
# BREW CASK:
# -----------------------------------

# set brew app names for cask
brew_cask_apps=(
  "iterm2"
  "dropbox"
  "firefox"
  "vlc"
  "xee"
  "the-unarchiver"
)

# install each cask names
for app in ${brew_cask_apps[@]}; do
  brew cask install ${app}
done

# cleanup
brew cask cleanup

# -----------------------------------
# BREW:
# -----------------------------------

# set brew app names
brew_apps=(
  "vim --with-lua"
  "rbenv"
  "pyenv"
  "fish"
)

# install each cask names
for app in ${brew_apps[@]}; do
  brew install ${app}
done
