fish_vi_key_bindings

set -gx EDITOR "nvim -f"
set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set -gx LANG "en_US.UTF-8"

# For ruby debug
set -gx RUBY_DEBUG_NO_RELINE 1

# Add paths, codespace doesn't have latest fish (>3.2) so can't use `fish_add_path` yet
contains ~/.cargo/bin $fish_user_paths; or set -Ua fish_user_paths ~/.cargo/bin $fish_user_paths
contains ~/.deno/bin $fish_user_paths; or set -Ua fish_user_paths ~/.deno/bin $fish_user_paths
contains ~/.bin $fish_user_paths; or set -Ua fish_user_paths ~/.bin $fish_user_paths
contains ~/.foundry/bin $fish_user_paths; or set -Ua fish_user_paths ~/.foundry/bin $fish_user_paths
#fish_add_path ~/.cargo/bin
#fish_add_path ~/.deno/bin
#fish_add_path ~/.bin
#fish_add_path ~/.foundry/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test (uname) = "Linux"
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv) # homebrew
  #source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish # asdf
end

if test (uname) = "Darwin"
  eval (/opt/homebrew/bin/brew shellenv) # homebrew
  #source /opt/homebrew/opt/asdf/libexec/asdf.fish # asdf
end

mise activate fish | source

if test -e ~/.local.fish
  source ~/.local.fish
end
