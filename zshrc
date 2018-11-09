source ~/.bin/base16-monokai.dark.sh

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

stty -ixon

conflicted() {
  vim +Conflicted
}

alias 'gst'='git status'
alias 'gup'='git smart-pull'
alias 'gsm'='git smart-merge'
alias 'gsl'='git smart-log'
alias 'v'='vim'
alias 'fst'='forego start -f Procfile.dev'
alias 'pst'='passenger start'
alias 'vup'='vagrant up --provider=vmware_fusion'
alias 'vimup'='vim +PlugUpdate +qall'
alias 'script/console'='script/console --irb=pry'
alias 'npm'='noglob npm'
alias 'spt'='bin/spring stop'
alias 'ips'='iex -S mix phx.server'
alias 'ism'='iex -S mix'
alias 'git'='hub'
alias 'git-cleanup'='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

#avoid 'unknown terminal type' errors in ssh via tmux
alias 'ssh'='TERM=xterm ssh'

#Hack workaround to load gemset on new tmux pane
cd .

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
