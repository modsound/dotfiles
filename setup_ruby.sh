#!/bin/sh

# maintainer: 
#   modsound@gmail.com
# abs: 
#   install rails

# install latest stable ruby
if type 'rbenv'; then
  rbenv install $(rbenv install -l | grep -v - | tail -1)

  # install rails
  gem update --system
  gem install rails

else
  echo "not found rbenv command"
fi
