function gh-purge-workflow -d "Delete GitHub Actions workflow runs for a repository"
    argparse h/help dry-run 'l/limit=!_validate_int --min 1' -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: gh-purge-workflow [OPTIONS] [WORKFLOW]"
        echo ""
        echo "Delete GitHub Actions workflow runs for the current repository."
        echo ""
        echo "Arguments:"
        echo "  WORKFLOW    Workflow name to purge (default: CI)"
        echo ""
        echo "Options:"
        echo "  -h, --help      Show this help message"
        echo "  -l, --limit N   Max number of runs to delete (default: 20)"
        echo "  --dry-run       Show which runs would be deleted without deleting"
        echo ""
        echo "Examples:"
        echo "  gh-purge-workflow                  # Delete up to 20 CI workflow runs"
        echo "  gh-purge-workflow Tests             # Delete runs for 'Tests' workflow"
        echo "  gh-purge-workflow --limit 50        # Delete up to 50 CI runs"
        echo "  gh-purge-workflow --dry-run -l 10   # Preview 10 CI runs that would be deleted"
        return 0
    end

    set -l workflow (test (count $argv) -gt 0; and echo $argv[1]; or echo "CI")
    set -l limit (test -n "$_flag_limit"; and echo $_flag_limit; or echo 20)

    set -l repo (gh repo view --json nameWithOwner -q .nameWithOwner)
    or return 1

    set -l run_ids (gh run list -w $workflow --limit $limit --json databaseId -q '.[].databaseId')

    if test -z "$run_ids"
        echo "No runs found for workflow '$workflow'"
        return 0
    end

    set -l ids (string split \n -- $run_ids)
    echo "Found "(count $ids)" run(s) for workflow '$workflow'"

    if set -q _flag_dry_run
        echo "Dry run — the following runs would be deleted:"
        for id in $ids
            echo "  run $id → DELETE repos/$repo/actions/runs/$id"
        end
        return 0
    end

    for id in $ids
        echo "Deleting run $id..."
        gh api "repos/$repo/actions/runs/$id" -X DELETE
    end

    echo "Done. Deleted "(count $ids)" run(s)."
end
