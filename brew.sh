
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install more recent versions of some macOS tools.
brew install openssh

# install command line tools
brew install fzf
brew install peco
brew install vim
brew install ghq
brew install bat
brew install fd
brew install eza
brew install hub
brew install jq
brew install tig
brew install curl
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install --cask raycast
brew install --cask google-chrome
brew install --cask Arc
brew install --cask iterm2
brew install --cask ghostty
# install font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# starship
curl -sS https://starship.rs/install.sh | sh

echo "👍 brew install is done!"
