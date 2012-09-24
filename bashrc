#alias git
alias gpush="git push origin master"
alias gpull="git pull"
alias gc="git commit"
alias gs="git status"
alias ga="git add -A"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"

#alias svn
alias ss="svn status"
alias sc="svn commit"
alias sup="svn update"

alias screen="screen -xR"
alias sr="screen -xR"

alias ll="ls -lh"
alias la="ls -alh"
alias cp="cp -v -i"
alias mv="mv -v -i"
alias rm="rm -v"

alias df="df -hT"
alias dush="du -sh"

alias his="history | grep "
alias ff='find . -name $*'

#PHPUnit
alias pu="phpunit --colors"

function gr() {
	command grep -r --color $1 ./
}
