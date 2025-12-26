#!/bin/zsh

# Dotfiles setup
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)
BACKUP_DIR=$HOME/dotfiles_backup_$(date +%Y%m%d%H%M%S)

echo "Creating backup directory at $BACKUP_DIR"
mkdir -p $BACKUP_DIR

# Function to create a symlink and backup existing file
link_file() {
    local src=$1
    local dest=$2
    # Expand ~ to $HOME
    dest="${dest/#\~/$HOME}"
    local dest_dir=$(dirname "$dest")

    if [ ! -d "$dest_dir" ]; then
        echo "Creating directory $dest_dir"
        mkdir -p "$dest_dir"
    fi

    if [ -L "$dest" ]; then
        echo "Removing existing symlink at $dest"
        rm "$dest"
    elif [ -e "$dest" ]; then
        echo "Backing up $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR"
    fi

    echo "Creating symlink for $src to $dest"
    ln -snf "$src" "$dest"
}

echo "Setting up symlinks for dotfiles..."

link_file "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
link_file "$DOTFILES_DIR/.gitignore" ~/.gitignore
link_file "$DOTFILES_DIR/.zshrc" ~/.zshrc
link_file "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
link_file "$DOTFILES_DIR/.peco" ~/.peco
link_file "$DOTFILES_DIR/.vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
link_file "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "Configuring global gitignore..."
git config --global core.excludesfile ~/.gitignore

echo "✅ Dotfiles setup complete!"


# Ensure Homebrew is installed
if ! (type brew > /dev/null 2>&1); then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH for the current session
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed."
fi

# Run brew.sh to install all Homebrew packages
echo "Running brew.sh to install Homebrew packages..."
"$DOTFILES_DIR/brew.sh"

# Install mise if not already installed
if ! (type mise > /dev/null 2>&1); then
  echo "mise not found. Installing mise..."
  brew install mise
else
  echo "mise is already installed."
fi

# Install latest versions of Node.js, Rust, and Flutter
mise use -g node@latest
mise use -g rust@latest
mise use -g flutter@latest

echo "👍 mise install is done!"
echo "Please restart your shell or run 'source ~/.zshrc' to apply the changes."