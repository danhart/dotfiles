export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export NODE_PATH="/usr/local/lib/node_modules"

alias l='ls -lA'
alias ll='ls -lA'
alias chromemobile='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -user-agent="iPhone"'
alias gst='git status'
alias gl='git l'
alias fdns='dscacheutil -flushcache'
alias gpf='git push -f origin HEAD'
alias gpo='git push origin HEAD'
alias mvim='open -a MacVim'
alias sbp='source ~/.bash_profile'

function commit_for_patch() {
  head -1 .git/rebase-apply/${1} | awk '{ print $2 }'
}

function delete_origin_branch() {
  git push origin :${1}
}

function delete_local_branch() {
  git branch -D ${1}
}

function delete_branch() {
  delete_origin_branch ${1}
  delete_local_branch ${1}
  git remote prune origin
  git gc
}

export PATH="/usr/local/bin:$PATH"

export EDITOR="vim"

source ~/bin/git-completion.sh
source ~/bin/git_svn_bash_prompt.sh

if [[ -s ~/.bash_local ]] ; then source ~/.bash_local ; fi
