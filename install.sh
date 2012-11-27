#!/bin/bash

function ensure_link {
  test -L $2 || ln -s $1 $2
}

ensure_link ${PWD}/bash_profile ~/.bash_profile
ensure_link ${PWD}/ctags ~/.ctags
ensure_link ${PWD}/vimrc ~/.vimrc
ensure_link ${PWD}/vim ~/.vim
ensure_link ${PWD}/ackrc ~/.ackrc
ensure_link ${PWD}/gitconfig ~/.gitconfig
ensure_link ${PWD}/gitignore ~/.gitignore

ensure_link ${PWD}/bin ~/bin

