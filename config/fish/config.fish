fish_vi_key_bindings

set -gx EDITOR "nvim -f"
set -gx GPG_TTY (tty)

# Add paths
fish_add_path ~/.cargo/bin
fish_add_path ~/.deno/bin
fish_add_path ~/.bin
fish_add_path ~/.foundry/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

if test -e ~/.local.fish
  source ~/.local.fish
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
