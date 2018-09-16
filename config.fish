# git
alias g='git'
alias pull='git pull origin'
alias push='git push origin'
alias diff='git diff'

# actovator
alias acuc='activator-cleanu-pdate-compile'

# vim
alias vi='/usr/bin/vim'

# cd > ls
function cd
  builtin cd $argv[1]
  ls
end

# encoding
set -x LANG ja_JP.UTF-8

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

# homebrew
set -U fish_user_paths /usr/local/bin $fish_user_paths

# go
set GOPATH $HOME
set PATH $PATH $GOPATH/bin
