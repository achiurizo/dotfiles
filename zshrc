
function is_osx() {
  [ $(uname -s) = "Darwin" ]
}

function source_if_exist() {
  local dotfile=$1
  if [[ -a $dotfile ]]
  then
    source $dotfile
  fi
}

# EDITORS
#
export EDITOR='nvim'
export GIT_EDITOR='nvim -f'

# History Configurations
#
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt SHARE_HISTORY        # shared history between session
setopt EXTENDED_HISTORY     # timestamp for history
setopt APPEND_HISTORY       # adds history
setopt INC_APPEND_HISTORY   # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Bindings
#
bindkey -v                                               # Vim bindings
bindkey '^R' history-incremental-pattern-search-backward # allow CTRL-R backward history search

# Visual Edit Command Line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Paths
#
PATH="/bin"
PATH="/sbin:$PATH"
PATH="/usr/bin:$PATH"
PATH="/usr/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/.bin:$PATH"
PATH="bin:$PATH"

source_if_exist "/opt/github/env.sh"
source_if_exist "$HOME/.chruby.zsh"
source_if_exist "$HOME/.nvm.zsh"
source_if_exist "$HOME/.zshrc.local"
source_if_exist "$HOME/.aliases"

# zsh completions
fpath=($(brew --prefix)/share/zsh/site-functions/ $fpath)

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# zplug
#
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh, as:plugin, nice:0
zplug "zsh-users/zsh-syntax-highlighting", nice:10
setopt prompt_subst # Make sure propt is able to be generated properly.
zplug "~/.dotfiles/zsh/minimal-plus.zsh-theme", from:local, as:plugin, nice:11
#zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:plugin, use:"bullet-train.zsh-theme", nice:11

zplug load
