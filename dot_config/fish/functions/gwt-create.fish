function gwt-create -d "Create git worktree for feature development" -a branch_name
    if test -z "$branch_name"
        echo "Usage: gwt-create <branch-name>"
        return 1
    end

    # Get project name from current directory
    set -l project_name (basename (pwd))

    # Create worktree path: ../project-feature-name
    set -l worktree_path ".worktrees/$branch_name"

    # Create worktree with new branch
    git worktree add -b $branch_name $worktree_path

    if test $status -eq 0
        echo "Worktree created at: $worktree_path"
        echo "Switching to worktree..."
        cd $worktree_path
    else
        echo "Failed to create worktree"
        return 1
    end
end
