function gwt -d "Git worktree management"
    set -l cmd $argv[1]
    set -l args $argv[2..-1]

    switch $cmd
        case create
            _gwt_create $args
        case list ls
            _gwt_list
        case remove rm
            _gwt_remove
        case switch sw
            _gwt_switch $args
        case ''
            _gwt_usage
        case '*'
            echo "Unknown command: $cmd"
            _gwt_usage
            return 1
    end
end

function _gwt_usage
    echo "Usage: gwt <command> [args]"
    echo ""
    echo "Commands:"
    echo "  create <branch>  Create worktree and switch to it"
    echo "  list             List all worktrees"
    echo "  remove           Remove worktree (fzf picker)"
    echo "  switch [branch]  Switch to worktree (fzf picker if no branch)"
end

function _gwt_main_repo
    git worktree list | head -1 | awk '{print $1}'
end

function _gwt_create
    set -l branch_name $argv[1]

    if test -z "$branch_name"
        echo "Usage: gwt create <branch-name>"
        return 1
    end

    set -l main_repo (_gwt_main_repo)
    set -l worktree_path "$main_repo/.worktrees/$branch_name"

    git worktree add -b $branch_name $worktree_path

    if test $status -eq 0
        echo "Worktree created at: $worktree_path"
        cd $worktree_path
    else
        return 1
    end
end

function _gwt_list
    git worktree list
end

function _gwt_remove
    if not type -q fzf
        echo "Error: fzf is required for this command"
        return 1
    end

    set -l main_repo (_gwt_main_repo)
    set -l selected (git worktree list | grep "\.worktrees/" | fzf --height=40% --reverse | awk '{print $1}')

    if test -n "$selected"
        echo "Removing worktree: $selected"
        git worktree remove $selected
    end
end

function _gwt_switch
    set -l branch_name $argv[1]
    set -l main_repo (_gwt_main_repo)

    if test -n "$branch_name"
        set -l worktree_path "$main_repo/.worktrees/$branch_name"
        if test -d $worktree_path
            cd $worktree_path
        else
            echo "Worktree not found: $worktree_path"
            return 1
        end
    else
        if not type -q fzf
            echo "Error: fzf is required for this command"
            return 1
        end

        set -l selected (git worktree list | grep "\.worktrees/" | fzf --height=40% --reverse | awk '{print $1}')

        if test -n "$selected"
            cd $selected
        end
    end
end
