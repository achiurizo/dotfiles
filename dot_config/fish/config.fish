fish_vi_key_bindings

set -gx EDITOR "nvim -f"
set -gx GPG_TTY (tty)

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
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

if test (uname) = "Darwin"
  eval "$(/opt/homebrew/bin/brew shellenv)"
end

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

if test -e ~/.local.fish
  source ~/.local.fish
end
