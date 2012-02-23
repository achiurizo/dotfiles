if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
[[ -s "/Users/achiu/.rvm/scripts/rvm" ]] && source "/Users/achiu/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
