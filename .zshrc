#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs.
export EDITOR='vim'

### jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

### pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### direnv
# eval "$(direnv hook zsh)"

### deno
export PATH=~/.deno/bin:${PATH}

### Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

###-----------------------------------
###alias
###-----------------------------------
alias lg='lazygit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sozsh='source ~/.zshrc'
alias zshconfig='vim ~/.zshrc'

###--------------------------------------
### その他
### -------------------------------------
fpath=(path/to/zsh-completions/src $fpath)

###-------------------------------------
# git alias
###-------------------------------------
alias g='git'
alias pull='git pull'
alias push='git push'
alias diff='git diff'
alias gco='git checkout'
alias n='git checkout -b'

###-------------------------------------
### cdしたあとで、自動的に ls する
###-------------------------------------
 vfunction chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

###-------------------------------------
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
###-------------------------------------
setopt prompt_subst


# --------------------------------------------------
#  コマンド入力補完
# --------------------------------------------------

# カレントディレクトリ表示
RPROMPT='%B%F{green}[%d]%f%b'

# 補完機能有効にする
autoload -U compinit
compinit -u
 
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
 
# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
 
# コマンドの打ち間違いを指摘してくれる
#setopt correct
#SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
