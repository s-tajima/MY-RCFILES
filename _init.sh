#!/bin/bash

sig=`cat <<EOF
###
# added by ~/MY-RCFILES/_init.sh
###
EOF`

RED="\e[31m"
GRN="\e[32m"
END="\e[00m"

##
# bashrc
##
rcfile="$HOME/.bashrc"
source="source ~/MY-RCFILES/bashrc"
if grep "${source}" ${rcfile} > /dev/null; then
	echo -e "${source} is ${RED}found${END}"
else
	echo -e "${source} is ${GRN}not found${END}"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo -e "add ${source} to ${rcfile}"
fi

##
# vimrc
##
rcfile="$HOME/.vimrc"
source="source ~/MY-RCFILES/vimrc"
if grep "${source}" ${rcfile} > /dev/null; then
	echo -e "${source} is ${RED}found${END}"
else
	echo -e "${source} is ${GRN}not found${END}"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo -e "add ${source} to ${rcfile}"
fi

##
# screenrc
##
rcfile="$HOME/.screenrc"
source="source $HOME/MY-RCFILES/screenrc"
if grep "${source}" ${rcfile} > /dev/null; then
	echo -e "${source} is ${RED}found${END}"
else
	echo -e "${source} is ${GRN}not found${END}"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo -e "add ${source} to ${rcfile}"
fi

##
# inputrc
##
rcfile="$HOME/.inputrc"
source="source $HOME/MY-RCFILES/inputrc"
if grep "${source}" ${rcfile} > /dev/null; then
	echo -e "${source} is ${RED}found${END}"
else
	echo -e "${source} is ${GRN}not found${END}"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo -e "add ${source} to ${rcfile}"
fi
