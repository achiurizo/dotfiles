# Go
if which go > /dev/null; then
  if [ $(uname -s) = "Darwin" ]; then
    export GOPATH=$HOME/code/go
  fi
fi
