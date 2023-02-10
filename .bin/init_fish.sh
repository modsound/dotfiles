#!/bin/bash

echo $(basename "$0") "を実行します。"

echo "シンボリックリンクを作成します。"
ln -sf ~/dotfiles/.bin/config.fish ~/.config/fish/config.fish

echo "プラグインマネージャーをインストールします。"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

echo "fishの補完候補を追加します。"
fish_update_completion

echo "デフォルトシェルをfishに変更します。"
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
