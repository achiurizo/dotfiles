source $HOME/.zsh/config
source $HOME/.zsh/paths
source $HOME/.zsh/aliases
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="cloud"

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

# non-generic aliases
if [ -f $HOME/.zsh_aliases ]; then
  source $HOME/.zsh_aliases
fi

# rvm-install added line:
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Vim bindings
bindkey -v
