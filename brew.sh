
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install more recent versions of some macOS tools.
brew install openssh

# install command line tools
brew install fzf
brew install peco
brew install asdf
brew install vim
brew install ghq
brew install bat
brew install fd
brew install exa
brew install hub
brew install jq
brew install tig
brew install curl
brew install mise

brew install --cask raycast
brew install --cask google-chrome
brew install --cask Arc

# install font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "👍 brew install is done!"
