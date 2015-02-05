set rtp+=$GOROOT/misc/vim
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
