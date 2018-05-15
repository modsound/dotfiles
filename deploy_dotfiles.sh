#!/bin/bash

# maintainer: 
#   modsound@gmail.com
# abs: 
#   download dotfiles to your home directory and alias each file
#   skip if already exist dotfiles directory

# set path as const
DOT_DIR="$HOME/dotfiles"
REPOSITORY="https://github.com/modsound/dotfiles"
TARBALL="https://github.com/modsound/dotfiles/tarball/master"
LOCAL_TARBALL="$HOME/dotfiles.tar.gz"

# DOTDIR if not found
if [ ! -d ${DOT_DIR} ]; then

  mkdir -p ${DOT_DIR}

  # check if it has git
  if type "git"; then
    git clone --recursive ${REPOSITORY} ${DOT_DIR}
  # check if it has curl
  elif type "curl"; then
    # copy remote tarball to local
    curl -fsSLo ${LOCAL_TARBALL} ${TARBALL}
    # extract tarball
    tar -zxf ${LOCAL_TARBALL} --strip-components 1 -C ${DOT_DIR}
    rm -f ${LOCAL_TARBALL}
  # if both command no found
  else
    echo "require git/curl command"
    exit 1
  fi

  # loop files in current dir
  cd ${DOT_DIR}
  for file in .??*
  do
    # set ignore files
    [ ${file} == ".git" ] && continue
    [ ${file} == ".DS_Store" ] && continue

    # link symbolic link force
    ln -snfv ${DOT_DIR}/${file} ${HOME}/${file}
  done

# already exists DOT_DIR
else
  echo "Maybe already setup dotfiles"
fi
