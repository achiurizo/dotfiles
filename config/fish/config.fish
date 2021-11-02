fish_vi_key_bindings

set -x EDITOR "nvim -f"
set -x GIT_EDITOR "nvim -f"
set -x GPG_TTY (tty)
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/bin

# Load the ASDF
if test -e ~/.asdf/asdf.fish 
  source ~/.asdf/asdf.fish
end

# Local config
if test -e ~/.local.fish
  source ~/.local.fish
end
