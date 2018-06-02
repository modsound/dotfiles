# disable greeting
set fish_greeting

# path
set -x PATH /usr/local/bin $PATH

# init rbenv
rbenv init - | source

# cd alias
alias ..='cd ../'
alias ...='cd ../..'
alias p='cd ~/Documents/code/'
alias die='rm -rf'

# app alias
alias v='vim'
alias vi='vim'
alias g='git'
alias r='rails'
