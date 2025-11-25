function git-prune-closed --description "Delete branches with merged or closed PRs"
    for branch in (git for-each-ref --format="%(refname:short)" refs/heads)
        set -l state (gh pr view $branch --json state -q .state 2>/dev/null)
        if test "$state" = "MERGED" -o "$state" = "CLOSED"
            echo "Deleting $branch (PR $state)..."
            git branch -d $branch 2>/dev/null
            or echo "  ^ not fully merged, use git branch -D $branch to force"
        end
    end
end
