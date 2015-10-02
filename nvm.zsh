export NVM_DIR=~/.nvm
if which brew > /dev/null; then
  source_if_exist "$(brew --prefix nvm)/nvm.sh"
fi
