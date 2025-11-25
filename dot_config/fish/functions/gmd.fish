function gmd -d "Delete local branches for merged PRs (handles squash merges)"
    set -l branches (gh pr list --state merged --author "@me" --json headRefName -q ".[].headRefName" 2>/dev/null)

    if test -z "$branches"
        echo "No merged PR branches found"
        return 0
    end

    for branch in $branches
        if git show-ref --verify --quiet refs/heads/$branch
            git branch -d $branch
            and echo "Deleted: $branch"
            or git branch -D $branch && echo "Force deleted: $branch (squash merged)"
        end
    end
end
