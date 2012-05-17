#!/bin/sh

sig=`cat <<EOF
###
# added by ~/MY-RCFILES/_init.sh
###
EOF`

rcfile="$HOME/.bashrc"
source="source ~/MY-RCFILES/bashrc"

if grep "${source}" ${rcfile} > /dev/null; then
	echo "${source} is found"
else
	echo "${source} is not found"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo "add ${source} to ${rcfile}"
fi

rcfile="$HOME/.vimrc"
source="source ~/MY-RCFILES/vimrc"

if grep "${source}" ${rcfile} > /dev/null; then
	echo "${source} is found"
else
	echo "${source} is not found"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo "add ${source} to ${rcfile}"
fi

rcfile="$HOME/.screenrc"
source="source $HOME/MY-RCFILES/screenrc"

if grep "${source}" ${rcfile} > /dev/null; then
	echo "${source} is found"
else
	echo "${source} is not found"
	echo -e "\n${sig}\n${source}\n" >> ${rcfile}
	echo "add ${source} to ${rcfile}"
fi
