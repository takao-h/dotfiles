# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

## other
alias ls "exa -h"
alias la "ls -aF"
alias ll 'exa -ahl'
alias lla "ls -laF"
alias cat bat

## Git
alias g git
alias pullm 'git pull origin master'
alias pushm 'git push origin master'
alias gs 'git status'
alias nb 'git checkcout -b'

## peco
# alias ghw='gh repo view -w $(ghq list | peco)'

function peco_cd
  set selected_dir (ls -1d */ | peco)
  if [ $selected_dir ]
    cd $selected_dir
    commandline -f repaint
  end
end

function fish_user_key_bindings
  bind /cc 'peco_cd' #追記
end

# ghq + peco
function ghq_peco_repo
  set selected_repository (ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_repository" ]
    cd $selected_repository
    echo " $selected_repository "
    commandline -f repaint
  end
end

# fish key bindings
function fish_user_key_bindings
  bind /cg ghq_peco_repo
end
