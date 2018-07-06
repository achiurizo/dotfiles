function gmdf
  git branch | grep -v master | xargs git branch -d
end
