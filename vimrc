source ~/MY-RCFILES/vim-plugin/vim-surround/surround.vim
source ~/MY-RCFILES/vim-plugin/vim-pathogen/pathogen.vim
call pathogen#runtime_append_all_bundles()

set nocompatible

set tabstop=4
set shiftwidth=4
set number
set hlsearch
set backspace=indent,eol,start
set smartindent

:nmap <C-J> <C-W>j
:nmap <C-K> <C-W>k
:nmap <C-H> <C-W>h
:nmap <C-L> <C-W>l

let php_folding=1
highlight Folded ctermfg=blue
highlight FoldColumn ctermfg=blue

map @r Dko<esc>pI
map @v veyovar_dump(<esc>pa);<esc>==:w<CR>
map @V veykovar_dump(<esc>pa);<esc>==:w<CR>
map @l veyo_log(<esc>pa);<esc>==:w<CR>
map @L veyko_log(<esc>pa);<esc>==:w<CR>
map @i veyoif(<esc>pa){<CR>}<esc>Vk=:w<CR>o
map @I veyoif(){<CR>}<esc>Vk=:w<CR>wa
map @f veyoforeach(){<CR>}<esc>Vk=:w<CR>wa

