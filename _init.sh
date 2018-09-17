#!/bin/bash

sig=`cat <<EOF
###
# added by ~/MY-RCFILES/_init.sh
###
EOF`

sig_vimrc=`cat <<EOF
"""
" added by ~/MY-RCFILES/_init.sh
"""
EOF`

##
# bashrc
##
rcfile="$HOME/.bashrc"
source="source ~/MY-RCFILES/bashrc"
if ! grep "${source}" ${rcfile} > /dev/null; then
	echo "\n${sig}\n${source}\n" >> ${rcfile}
fi

##
# vimrc
##
rcfile="$HOME/.vimrc"
source="source ~/MY-RCFILES/vimrc"
if ! grep "${source}" ${rcfile} > /dev/null; then
	echo "\n${sig_vimrc}\n${source}\n" >> ${rcfile}
fi

##
# screenrc
##
rcfile="$HOME/.screenrc"
source="source $HOME/MY-RCFILES/screenrc"
if ! grep "${source}" ${rcfile} > /dev/null; then
	echo "\n${sig}\n${source}\n" >> ${rcfile}
fi

##
# inputrc
##
#rcfile="$HOME/.inputrc"
#source="source $HOME/MY-RCFILES/inputrc"
#if ! grep "${source}" ${rcfile} > /dev/null; then
#	echo "\n${sig}\n${source}\n" >> ${rcfile}
#fi

##
# .vim
##
rcfile="$HOME/.vim"
source="$HOME/MY-RCFILES/vim"
if [ ! -L ${rcfile} ]; then
	ln -sf "${source}" "${rcfile}" > /dev/null
fi
