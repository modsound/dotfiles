# Download dotfiles
curl -fsSL "https://raw.githubusercontent.com/modsound/dotfiles/master/deploy_dotfiles.sh" | bash

# Run

## enable fish, install the plugins

bash ~/dotfiles/set_fish.sh

bash ~/dotfiles/set_fisher.sh

## enable brew, install the plugins

bash ~/dotfiles/set_brew.sh

## enable ruby, rails

bash ~/dotfiles/set_ruby.sh
