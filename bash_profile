export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export NODE_PATH="/usr/local/lib/node_modules"
export PS1="\u@\h \w $ "

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

function show_patch() {
  git show $(commit_for_patch ${1})
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

function matching_filenames() {
  find ${1} -type f -exec basename {} \; | xargs -L1 -J % ack % ${2}
}

export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"

export EDITOR="vim"

source ~/bin/git-completion.sh
source ~/bin/git_svn_bash_prompt.sh

if [[ -s ~/.bash_local ]] ; then source ~/.bash_local ; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
