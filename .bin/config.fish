# General

## disable greeting
set fish_greeting

# Path

## local bin
set -x PATH /usr/local/bin $PATH

# brew
set PATH /opt/homebrew/bin $PATH

# Alias

## cd alias
alias ..='cd ../'
alias ...='cd ../..'
alias die='rm -rf'

## App
alias v='nvim'
alias vi='nvim'
alias n='nvim'
alias g='git'

## Command
alias l='ls -a'

# Prompt

## default
function fish_prompt --description 'Write out the prompt'
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')

  # show path 
  printf "[%s%s%s]%s " (set_color $fish_color_cwd) $pwd (set_color normal) 
  # show mark
  printf (set_color cyan)(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯'
  # show git
  printf '%s ' (set_color blue)(__fish_git_prompt)(set_color normal)
end
