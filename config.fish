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

# function
alias rmds='find . -name ".DS_Store" | xargs rm'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

