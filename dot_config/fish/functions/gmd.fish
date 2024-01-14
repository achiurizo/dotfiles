function gmd
  git branch --merged | grep -v \* | xargs git branch -d
end
