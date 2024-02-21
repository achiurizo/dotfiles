function gh-ci-status
  set repoName (gh repo view --json "nameWithOwner" | jq '.nameWithOwner')
  set currentCommit (git rev-parse HEAD)
  gh ci-status $repoName $currentCommit | jq -r '.statuses[] | [.context, .state] | @csv' | gum table -w 50
end
