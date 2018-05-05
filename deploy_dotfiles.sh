#!/bin/bash

# set path as const
DOTDIR="$HOME/dotfiles"
REPOSITORY="https://github.com/modsound/dotfiles"
TARBALL="https://github.com/modsound/dotfiles/tarball/master"

# DITDIR if not found
if [ ! -d ${DOTDIR} ]; then

  mkdir -p ${DOTDIR}

  # check if it has git
  if has "git"; then
    git clone --recursive ${REPOSITORY} ${DOTDIR}
  # check if it has curl
  elif has "curl"; then
    curl -L ${TARBALL} | tar xv -
  # check if it has wget
  elif has "wget"; then
    wget -O - ${TARBALL} | tar xv -
  else
    echo "require git/curl/wget command"
    exit 1
  fi

  mv -f dotfiles-master ${DOTDIR}

  # loop files in current dir
  cd ${DOTDIR}
  for file in .??*
  do
    # set ignore files
    [ ${file} == ".git" ] && continue
    [ ${file} == ".DS_Store" ] && continue

    # link symbolic link force
    ln -snfv ${DOTDIR}/${file} ${HOME}/${file}
  done

# already exists DOTDIR
else
  echo "Already setup"
fi
