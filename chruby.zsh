[ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ] || return
source /opt/boxen/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/boxen/homebrew/opt/chruby/share/chruby/auto.sh

RUBIES+=(/opt/boxen/rbenv/versions/*)
