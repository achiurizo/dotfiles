# Environment variables and PATH configuration

# Editor
set -gx EDITOR "nvim -f"
set -gx GPG_TTY (tty)

# FZF configuration
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"

# Locale
set -gx LANG "en_US.UTF-8"

# Ruby debug mode
set -gx RUBY_DEBUG_NO_RELINE 1

# PATH additions - only add if directory exists
set -l custom_paths \
    ~/.cargo/bin \
    ~/.deno/bin \
    ~/.bin \
    ~/.local/bin \
    ~/.foundry/bin

for path_dir in $custom_paths
    if test -d $path_dir
        contains $path_dir $fish_user_paths; or set -Ua fish_user_paths $path_dir
    end
end

# Mise version manager initialization
if type -q mise
    mise activate fish | source
end
