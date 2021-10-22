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
alias ghw='gh repo view -w $(ghq list | peco)'

##
function fish_prompt
  set -l last_status $status
  printf ' '
  if test $last_status -eq 0
    set_color yellow
    printf '✘╹◡╹✘'
  else
    set_color red
    printf '✘>﹏<✘'
  end
  set_color normal
  printf " < \n"
end