# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs.
# export EDITOR='vim'

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

### Rust
export PATH="$HOME/.cargo/bin:$PATH"

### git
export PATH="/usr/local/git/bin:$PATH"
###-----------------------------------
###alias
###-----------------------------------
alias lg='lazygit'


### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### direnv
# eval "$(direnv hook zsh)"

###--------------------------------------
### その他
### ------------------------------------

fpath=(path/to/zsh-completions/src $fpath)

# git alias
alias g='git'
alias pol='git pull origin main'
alias pom='git push origin main'
alias lg='lazygit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sozsh='source ~/.zshrc'
alias zshconfig='vim ~/.zshrc'
alias n='git swotch -c'
alias acc='git add -A && commit'

alias ls="exa -h"
alias la="ls -aF"
alias ll="ls -lF"
alias lla="ls -laF"

alias airpods='sh /Users/rem/dotfiles/airpodsconnect.sh'

alias hb='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# cdしたあとで、自動的に ls する
 vfunction chpwd() { lsd; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# カレントディレクトリ表示
## RPROMPT='%B%F{green}[%d]%f%b'

# --------------------------------------------------
#  コマンド入力補完
# --------------------------------------------------

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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/rem/.sdkman"
[[ -s "/Users/rem/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/rem/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

## starship
eval "$(starship init zsh)"

# Shell Integration済みであること
iterm2_print_user_vars() {
  iterm2_set_user_var 任意の名前 $(my_badge)
}
# バッジで表示する文字列を返す関数
function my_badge() {
    if [ "$USER" = "root" ];then
        echo "root"
    else
        echo "rootじゃないよ"
    fi
}

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

## test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH=$PATH:$HOME/development/flutter/bin
