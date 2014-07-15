# Paths
#
export PATH="~/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Go
if which go > /dev/null; then
  if is_osx; then
    export GOPATH=$HOME/code/go
    export GOBIN=$HOME/code/go/bin
    export PATH=$PATH:$(brew --prefix)/opt/go/libexec/bin
    export PATH=$GOBIN:$PATH
  fi
fi

# Python
if which python > /dev/null; then
  if is_osx; then
    export PYTHONSTARTUP=$HOME/.pythonrc
    export PATH=$(brew --prefix)/share/python:$PATH
    export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
  fi
fi

# Node
if which npm > /dev/null; then
  export PATH=/usr/local/share/npm/bin:$PATH
  if [[ -e /opt/boxen/nodenv ]]
  then
    export NODE_PATH=$NODE_PATH:/opt/boxen/nodenv/versions/v0.10/lib/node_modules
  fi
fi
