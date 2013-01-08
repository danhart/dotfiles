#!/bin/bash

function ensure_link {
  test -L "$2" || ln -s "$1" "$2"
}

ensure_link "${PWD}/bash_profile" "$HOME/.bash_profile"
ensure_link "${PWD}/ctags" "$HOME/.ctags"
ensure_link "${PWD}/vimrc" "$HOME/.vimrc"
ensure_link "${PWD}/vim" "$HOME/.vim"
ensure_link "${PWD}/ackrc" "$HOME/.ackrc"
ensure_link "${PWD}/gitconfig" "$HOME/.gitconfig"
ensure_link "${PWD}/gitignore" "$HOME/.gitignore"

ensure_link "${PWD}/bin" "$HOME/bin"

