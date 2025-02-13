#!/bin/zsh

# miseコマンドがなければmiseをインストール
if ! (type mise > /dev/null 2>&1); then
  if ! (type brew > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install coreutils curl git
  brew install mise
fi

# zsh設定に書き込み
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc

# Install Node.js
mise use -g node@latest

# Install Rust
mise use -g rust@latest

# Install Flutter
mise use -g flutter@latest

# 最新バージョンを確認して設定
NODE_VERSION=$(mise ls-remote node | grep -v - | tail -n 1)
RUST_VERSION=$(mise ls-remote rust | grep -v - | tail -n 1)
FLUTTER_VERSION=$(mise ls-remote flutter | grep -v - | tail -n 1)

mise global node@$NODE_VERSION
mise global rust@$RUST_VERSION
mise global flutter@$FLUTTER_VERSION

echo "👍 mise install is done!"

# 変更を反映
source ~/.zshrc
