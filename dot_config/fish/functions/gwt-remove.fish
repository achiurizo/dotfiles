function gwt-remove -d "Remove git worktree with fzf selection"
    if not type -q fzf
        echo "Error: fzf is required for this function"
        return 1
    end

    # List worktrees, let user select with fzf, extract path
    set -l selected_worktree (git worktree list | \
        fzf --height=40% --reverse | \
        awk '{print $1}')

    if test -n "$selected_worktree"
        echo "Removing worktree: $selected_worktree"
        git worktree remove $selected_worktree
    else
        echo "No worktree selected"
    end
end
