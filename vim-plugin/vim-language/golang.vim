set rtp+=$GOROOT/misc/vim
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle      'Blackrush/vim-gocode'
call neobundle#end()
