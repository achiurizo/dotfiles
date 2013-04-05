# Python
if which python > /dev/null; then
  export PYTHONSTARTUP=~/.pythonrc
  export PATH=/usr/local/share/python:$PATH
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
fi
