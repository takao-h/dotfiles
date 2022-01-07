#!/bin/sh

# asdfコマンドがなければasdfをインストール
if ! (type asdf > /dev/null 2>&1); then
  if ! (type brew > /dev/null 2>&1); then
    sh homebrew/install.sh
  fi
  brew install coreutils curl git
  brew install asdf
fi

# fish設定に書き込み
echo -e "\nsource "(brew --prefix asdf)"/asdf.fish" >> ~/.config/fish/config.fish

# Install Node.js
asdf install nodejs latest
asdf global nodejs "$(asdf list nodejs | tail -1 | sed -e 's/ //g')"

# Install Rust
asdf install rust latest
asdf global rust "$(asdf list rust | tail -1 | sed -e 's/ //g')"

# Install Flutter
asdf install flutter latest
asdf global flutter "$(asdf list flutter | tail -1 | sed -e 's/ //g')"

echo "👍 asdf install is done!"
