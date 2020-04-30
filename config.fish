 # git alias
 alias g='git'
 alias pull='git pull origin'
 alias push='git push origin'
 alias diff='git diff'
 alias n='git switch -n'
 alias reset ='git restore --staged'

 # alias
 alias cat='bat'
 alias ls='exa'

 # actovator
 alias acuc='activator cleanu pdate compile run'
 alias debug='activator -jvm-debug 9999 run'

 # vim
 alias vi='/usr/bin/vim'

 # cd > ls
 function cd
   builtin cd $argv[1]
   exa
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
