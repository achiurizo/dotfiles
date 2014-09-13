[ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return
if which brew > /dev/null; then
  source_if_exist "$(brew --prefix)/share/chruby/chruby.sh"
  source_if_exist "$(brew --prefix)/share/chruby/auto.sh"
else
  source_if_exist "/usr/local/share/chruby/chruby.sh"
  source_if_exist "/usr/local/share/chruby/auto.sh"
fi
