fish_vi_key_bindings

set fish_greeting ""
set EDITOR nvim -f
set GIT_EDITOR nvim -f
set GOPATH $HOME/go
set PATH /usr/local/sbin $PATH
set PATH $PATH $GOPATH/bin
set PATH node_modules/.bin $PATH


set NVM_DIR $HOME/.nvm

# Setup chruby
if which brew > /dev/null
  source (brew --prefix)"/share/chruby/chruby.fish"
  source (brew --prefix)"/share/chruby/auto.fish"
else
end

# Local config
if test -e ~/.local.fish
  source ~/.local.fish
end
