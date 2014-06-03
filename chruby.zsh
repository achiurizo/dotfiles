[ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return
source "$(brew --prefix)/share/chruby/chruby.sh"
source "$(brew --prefix)/share/chruby/auto.sh"
