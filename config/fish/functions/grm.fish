function grm
  git status | grep deleted | awk '{print \$3}' | xargs git rm
end
