# Fish shell configuration
# Main entry point - modular configuration loaded from conf.d/

# VI key bindings
fish_vi_key_bindings

# Interactive session commands
if status is-interactive
    # FZF integration keybindings (must come after fish_vi_key_bindings)
    if type -q fzf
        # Alt+C: FZF directory navigation
        bind -M insert \ec fzf-cd-widget
        bind -M default \ec fzf-cd-widget

        # Ctrl+R: FZF history search
        bind -M insert \cr fzf-history-widget
        bind -M default \cr fzf-history-widget
    end
end

# Load local machine-specific overrides (if exist)
if test -e ~/.local.fish
    source ~/.local.fish
end
