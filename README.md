# takao-h/dotfiles

Personal dotfiles for macOS, Zsh, Neovim, VSCode, and development tools. This repository aims to provide a quick and easy way to set up a new development environment.

## Features

*   **Zsh Configuration**: Uses Prezto for a powerful and customizable Zsh setup, including various aliases and functions.
*   **Neovim Configuration**: Based on LazyVim, providing a fast and extensible Neovim experience.
*   **VSCode Settings & Extensions**: Includes custom VSCode settings and automatically installs a predefined list of extensions.
*   **Starship Prompt**: A cross-shell prompt that's fast, customizable, and feature-rich.
*   **Homebrew Package Management**: Installs essential command-line tools and macOS applications (casks) via Homebrew.
*   **mise (formerly asdf)**: Manages language runtimes like Node.js, Rust, and Flutter, ensuring consistent development environments.
*   **macOS System Preferences**: Applies various macOS system-level configurations for a more optimized workflow.
*   **Git Configuration**: Global Git settings for user information and ignore rules.

## Installation

To set up your development environment with these dotfiles, follow these steps:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/takao-h/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ```

2.  **Run the installation script**:
    ```bash
    ./install.sh
    ```
    This script will:
    *   Create a backup of your existing dotfiles in `~/dotfiles_backup_YYYYMMDDHHMMSS`.
    *   Create symlinks for configuration files and directories (e.g., `.zshrc`, `nvim`, `starship.toml`, `.peco`, `.gitconfig`, `.gitignore`, VSCode settings).
    *   Ensure Homebrew is installed and then run `brew.sh` to install command-line tools and macOS applications (including Ghostty).
    *   Install `mise` (if not already present) and set up Node.js, Rust, and Flutter.
    *   Apply various macOS system preferences.
    *   Install VSCode extensions listed in `.vscode/extensions.txt`.

3.  **Restart your shell**:
    After the script completes, please restart your terminal or run `source ~/.zshrc` to apply the Zsh and Starship configurations.

## Structure

*   `.gitconfig`: Global Git configuration.
*   `.gitignore`: Global Git ignore rules.
*   `.zshrc`: Zsh configuration file.
*   `starship.toml`: Starship prompt configuration.
*   `.peco/`: Peco configuration.
*   `.vscode/`: VSCode settings and a list of extensions to install.
    *   `settings.json`: VSCode user settings.
    *   `extensions.txt`: List of VSCode extensions to install.
*   `nvim/`: Neovim configuration (LazyVim).
*   `brew.sh`: Script to install Homebrew packages and casks.
*   `install.sh`: The main installation script that orchestrates the setup process.
*   `macOS/install.sh`: Script to apply macOS system preferences.
