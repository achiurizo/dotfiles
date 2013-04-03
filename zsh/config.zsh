# Paths
#
export PATH="/usr/local/share/python:~/bin:$HOME/.bin:/opt/local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/share/npm/bin:$HOME/node_modules/.bin:$PATH"
export NODE_PATH="/usr/local/lib/node"
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

# EDITORS
#
export EDITOR='/usr/local/bin/vim'        # Install vim via homebrew
export GIT_EDITOR='/usr/local/bin/vim -f'

# History Configurations
#  
setopt SHARE_HISTORY                    # shared history between session
setopt EXTEND_HISTORY                   # timestamp for history
setopt APPEND_HISTORY                   # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS             # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# OH-MY-ZSH
#

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="wedisagree"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby brew gem github rvm git-flow)

source $ZSH/oh-my-zsh.sh

# Bindings
#
bindkey -v                                               # Vim bindings
bindkey '^R' history-incremental-pattern-search-backward # allow CTRL-R backward history search
