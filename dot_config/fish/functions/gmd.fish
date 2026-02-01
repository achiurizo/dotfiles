function gmd -d "Delete branches whose remote tracking branch is gone"
    argparse h/help d/dry-run f/force -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: gmd [OPTIONS]"
        echo ""
        echo "Delete local branches whose remote tracking branch is gone."
        echo "Uses GitHub API to safely delete squash-merged branches."
        echo ""
        echo "Options:"
        echo "  -d, --dry-run  Preview what would be deleted"
        echo "  -f, --force    Delete all gone branches without checking GitHub"
        echo "  -h, --help     Show this help message"
        return 0
    end

    git fetch -p

    set -l branches (git branch -vv | grep ': gone]' | awk '{print $1}')

    if test (count $branches) -eq 0
        echo "No branches to clean up"
        return 0
    end

    for branch in $branches
        if set -q _flag_force
            # Force mode: delete without checking GitHub
            if set -q _flag_dry_run
                echo "[dry-run] Would force delete $branch"
            else
                echo "Force deleting $branch..."
                git branch -D $branch
            end
        else
            # Check if PR was merged via GitHub API
            set -l merged_count (gh pr list --head $branch --state merged --json number 2>/dev/null | jq 'length')

            if test "$merged_count" -gt 0
                if set -q _flag_dry_run
                    echo "[dry-run] Would delete $branch (PR merged)"
                else
                    echo "Deleting $branch (PR merged)..."
                    git branch -D $branch
                end
            else
                if set -q _flag_dry_run
                    echo "[dry-run] Would skip $branch (no merged PR found)"
                else
                    echo "Deleting $branch..."
                    if not git branch -d $branch 2>/dev/null
                        echo "  ⚠ Branch $branch has unmerged changes, skipping (use -f to force)"
                    end
                end
            end
        end
    end
end
