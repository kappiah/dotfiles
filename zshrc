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
alias 'fst'='bundle exec foreman start -f Procfile.dev'
alias 'fssl'='bundle exec foreman start -f Procfile.dev_ssl'
alias 'ost'='overmind start -f Procfile.dev -F ~/dotfiles/overmind.conf'
alias 'ocw'='overmind connect web'
alias 'pst'='passenger start'
alias 'vup'='vagrant up --provider=vmware_fusion'
alias 'vimup'='vim +PlugUpdate +qall'
alias 'script/console'='script/console --irb=pry'
alias 'npm'='noglob npm'
alias 'spt'='bin/spring stop'
alias 'ips'='iex -S mix phx.server'
alias 'ism'='iex -S mix'
alias 'cop'='rubocop --parallel'
alias 'git-cleanup'='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias 'jmalloc-server'='DYLD_INSERT_LIBRARIES=/usr/local/Cellar/jemalloc/5.2.1_1/lib/libjemalloc.dylib ost'
alias 'tcmalloc-server'='DYLD_INSERT_LIBRARIES=/usr/local/Cellar/gperftools/2.8/lib/libtcmalloc.dylib ost'
alias 'perf-server'='SECRET_KEY_BASE=foobar RAILS_ENV=perftest PUMA_WORKERS=2 ost'
alias 'perf-console'='SECRET_KEY_BASE=foobar RAILS_ENV=perftest rails c'

#avoid 'unknown terminal type' errors in ssh via tmux
alias 'ssh'='TERM=xterm ssh'

 export DIRENV_LOG_FORMAT=
 eval "$(direnv hook zsh)"

# Hack workaround to load gemset on new tmux pane
cd .

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export ASDF_DIR='/usr/local/opt/asdf/libexec'
. "$(brew --prefix asdf)/libexec/asdf.sh"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/15/bin:$PATH"
# export PATH="/Applications/Postgres.app/Contents/Versions/16/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export CFLAGS="-O2 -g -fno-stack-check -Wno-error=implicit-function-declaration"
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"
