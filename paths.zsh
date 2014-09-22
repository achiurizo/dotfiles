# Go
if which go > /dev/null; then
  if is_osx; then
    export GOPATH=$HOME/code/go
    export GOBIN=$HOME/code/go/bin
    export PATH=$(brew --prefix)/opt/go/libexec/bin:$PATH
    export PATH=$GOBIN:$PATH
  fi
fi

# Python
if which python > /dev/null; then
  if is_osx; then
    export PYTHONSTARTUP=$HOME/.pythonrc
    export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
  fi
fi

# Node
if which npm > /dev/null; then
  if is_osx; then
    export PATH=$(brew --prefix)/share/npm/bin:$PATH
    export NODE_PATH=$(brew --prefix)/lib/node:$NODE_PATH
  fi
fi
