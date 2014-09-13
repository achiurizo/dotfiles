[ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return
source_if_exist "$(brew --prefix)/share/chruby/chruby.sh"
source_if_exist "$(brew --prefix)/share/chruby/auto.sh"
