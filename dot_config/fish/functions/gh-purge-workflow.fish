function gh-purge-workflow
  gh run list -w CI --json databaseId  -q '.[].databaseId' | xargs -I ID gh api "repos/$(gh repo view --json nameWithOwner -q .nameWithOwner)/actions/runs/ID" -X DELETE
end
