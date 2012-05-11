source ~/MY-RCFILES/vim-plugin/vim-surround/surround.vim
source ~/MY-RCFILES/vim-plugin/vim-pathogen/pathogen.vim
source ~/MY-RCFILES/vim-plugin/vim-javascript/javascript.vim
source ~/MY-RCFILES/vim-plugin/vim-autocursor/autocursor.vim
call pathogen#runtime_append_all_bundles()

set nocompatible

set tabstop=4
set shiftwidth=4
set number
set hlsearch
set backspace=indent,eol,start
set smartindent
"set wildmode=list:full
set wildmenu

filetype on
filetype indent on
"filetype plugin on

:nmap <C-J> <C-W>j
:nmap <C-K> <C-W>k
:nmap <C-H> <C-W>h
:nmap <C-L> <C-W>l

map @= mzgg=G`z

"neocomplcache settings ----
"let g:neocomplcache_enable_at_startup = 1
"---------------------------

function InsertTabWrapper()
	if pumvisible()
		return "\<c-n>"
	endif
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k\|<\|/'
		return "\<tab>"
	elseif exists('&omnifunc') && &omnifunc == ''
		return "\<c-n>"
	else
		return "\<c-x>\<c-o>"
	endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

ab #s #edited by Satoshi Tajima <C-R>=strftime("%Y-%m-%d %T")<CR>
ab //s /*********************************************************
ab //e  ********************************************************/


autocmd FileType php source ~/MY-RCFILES/vim-plugin/vim-language/php.vim
autocmd FileType python source ~/MY-RCFILES/vim-plugin/vim-language/python.vim
autocmd FileType ruby source ~/MY-RCFILES/vim-plugin/vim-language/ruby.vim
