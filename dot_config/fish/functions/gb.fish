function gb -d "Interactive git branch switcher with fzf"
    if not type -q fzf
        echo "Error: fzf is required for this function"
        return 1
    end

    # Get all branches (local and remote), format nicely
    set -l selected_branch (git branch --all --format='%(refname:short)' | \
        sed 's|^origin/||' | \
        sort -u | \
        fzf --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%h %C(blue)%ad %C(reset)%s" {}' \
            --preview-window=right:60% \
            --height=80%)

    if test -n "$selected_branch"
        git checkout $selected_branch
    end
end
