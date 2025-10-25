function fzf-history-widget -d "Search command history using fzf"
    # Get history in reverse chronological order, use fzf to select
    set -l result (history | fzf --tac --no-sort)

    if test -n "$result"
        commandline -r $result
        commandline -f repaint
    end
end
