function fzf-cd-widget -d "Change directory using fzf with eza preview"
    # Use fd to find directories, excluding .git
    set -l result (fd --type d --hidden --exclude .git | fzf --preview 'eza -la --git {}')

    if test -n "$result"
        cd $result
        commandline -f repaint
    end
end
