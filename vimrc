set nocompatible

set tabstop=4
set shiftwidth=4
set number
set hlsearch
set backspace=indent,eol,start

:nmap <C-J> <C-W>j
:nmap <C-K> <C-W>k
:nmap <C-H> <C-W>h
:nmap <C-L> <C-W>l

let php_folding=1
highlight Folded ctermfg=blue
highlight FoldColumn ctermfg=blue

map @r Dko<esc>pI
"map @v veyo<esc>pa);<esc>Ivar_dump(<esc>==:w<CR>
map @v veyovar_dump(<esc>pa);==:w<CR>
map @V veyko<esc>pa);<esc>Ivar_dump(<esc>==:w<CR>
map @l veyo<esc>pa);<esc>I_log(<esc>==:w<CR>
map @L veyko<esc>pa);<esc>I_log(<esc>==:w<CR>
