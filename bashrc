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

alias la="ls -al"
alias ll="ls -l"
alias cp="cp -i"
alias mv="mv -i"

alias his="history | grep "

#PHPUnit
alias pu="phpunit --colors"

function gr() {
	command grep -r --color $1 ./
}
