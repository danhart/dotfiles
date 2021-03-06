#!/bin/bash

function ensure_link {
  test -L "$2" || ln -s "$1" "$2"
}

ensure_link "${PWD}/iterm" "$HOME/iterm"
ensure_link "${PWD}/bash_profile" "$HOME/.bash_profile"
ensure_link "${PWD}/ctags" "$HOME/.ctags"
ensure_link "${PWD}/vimrc" "$HOME/.vimrc"
ensure_link "${PWD}/vim" "$HOME/.vim"
ensure_link "${PWD}/ackrc" "$HOME/.ackrc"
ensure_link "${PWD}/gitconfig" "$HOME/.gitconfig"
ensure_link "${PWD}/gitignore" "$HOME/.gitignore"
ensure_link "${PWD}/KeyRemap4MacBook" "$HOME/Library/Application Support/KeyRemap4MacBook"
ensure_link "${PWD}/weechat" "$HOME/.weechat"
ensure_link "${PWD}/tmux.conf" "$HOME/.tmux.conf"
ensure_link "${PWD}/irssi" "$HOME/.irssi"

ensure_link "${PWD}/bin" "$HOME/bin"

curl -LSso ~/Library/Fonts/powerline.otf "https://github.com/Lokaltog/powerline-fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf?raw=true"

git submodule init
git submodule update
