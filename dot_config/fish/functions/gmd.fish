function gmd -d "Delete branches whose remote tracking branch is gone"
    git fetch -p
    for branch in (git branch -vv | grep ': gone]' | awk '{print $1}')
        echo "Deleting $branch..."
        git branch -d $branch
    end
end
