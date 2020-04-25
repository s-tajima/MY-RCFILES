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

function gr() {
	command grep -r --color $1 ./
}

PS1="[\t \u@\h \W]$ "

#PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?" # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}[\t \u@\h \W]\$ ${RCol}"
    else
        PS1+="[\t \u@\h \W]\$ "
    fi
}
