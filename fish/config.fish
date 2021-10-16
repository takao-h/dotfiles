## other
alias ls="exa -h"
alias la="ls -aF"
alias ll='exa -ahl'
alias lla="ls -laF"
alias cat='bat'

## Git
alias lg='lazygit'
alias g='git'
alias pullm='git pull origin master'
alias pushm='git push origin master'
alias gs='git status'
alias acc='git add -a && git commit -m'
alias nb='git checkcout -b'

## peco
alias ghw='gh repo view -w $(ghq list | peco)'