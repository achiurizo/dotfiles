# Paths
#
export PATH="~/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"

# EDITORS
#
export EDITOR='vim'
export GIT_EDITOR='vim -f'

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

# OH-MY-ZSH
#

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="nanotech"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git osx ruby brew gem github rvm git-flow)
plugins=(gitfast)
source $ZSH/oh-my-zsh.sh

# Bindings
#
bindkey -v                                               # Vim bindings
bindkey '^R' history-incremental-pattern-search-backward # allow CTRL-R backward history search
