#!/bin/bash

# install homebrew
eval '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

# homebrew install cli
CLIBREWS=(
git
rbenv
ruby-build
)

for CLIBREW in ${CLIBREWS[@]};
do
  brew install $CLIBREW -y
done

# homebrew cask install gui
GUIBREWS=(
iterm2
google-chrome
sequel-pro
alfred
)

for GUIBREW in ${GUIBREWS[@]};
do
  brew cask install $GUIBREW
done

# rbenv install latest
echo 'export PATH="$HOME/.rbenv/bin:$PATH"\nif which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
eval "source ~/.bash_profile"

LATEST_RUBY=$(rbenv install -l | grep -v - | tail -1)
eval "rbenv install $LATEST_RUBY"
eval "rbenv global $LATEST_RUBY && rbenv rehash"
