function git-branch-status --description "Show PR status for each local branch"
    for branch in (git for-each-ref --format="%(refname:short)" refs/heads)
        set -l state (gh pr view $branch --json state -q .state 2>/dev/null)
        if test -z "$state"
            set state "no PR"
        end
        printf "%-30s %s\n" $branch $state
    end
end
