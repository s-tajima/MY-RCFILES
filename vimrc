autocmd!

source ~/MY-RCFILES/vim-plugin/vim-surround/surround.vim
source ~/MY-RCFILES/vim-plugin/vim-pathogen/pathogen.vim
source ~/MY-RCFILES/vim-plugin/vim-javascript/javascript.vim
source ~/MY-RCFILES/vim-plugin/vim-autocursor/autocursor.vim
call pathogen#runtime_append_all_bundles()

syntax on
set nocompatible
set tabstop=4
set shiftwidth=4
set number
set hlsearch
set backspace=indent,eol,start
set smartindent
"set wildmode=list:full
set wildmenu
set shell=/bin/bash\ -l\ -O\ expand_aliases
set virtualedit=block
set ignorecase
set smartcase
set title

:nmap <C-J> <C-W>j
:nmap <C-K> <C-W>k
:nmap <C-H> <C-W>h
:nmap <C-L> <C-W>l

vnoremap J 3j
vnoremap K 3k
vnoremap ss s

nnoremap <S-h> b
nnoremap <S-l> w
nnoremap r <C-R>
nnoremap <Space>. :<C-u>tabnew $HOME/MY-RCFILES/vimrc<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
nnoremap <expr> <Space>h ':<C-u>help ' . expand('<cword>') . '<CR>'
nnoremap <Space>- mzgg=G`z
nnoremap <Space>=  mz`[V`]=`z
nnoremap <CR> O
nnoremap <S-t> :tabnew
nnoremap <Space>gd :!git diff %<CR>

inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

ab #s #edited by Satoshi Tajima <C-R>=strftime("%Y-%m-%d %T")<CR>
ab //s /*********************************************************
ab //e  ********************************************************/

"neocomplcache settings ----
"let g:neocomplcache_enable_at_startup = 1
"---------------------------

"complement by <TAB>>
function! InsertTabWrapper()
	if pumvisible()
		return "\<c-n>"
	endif
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k\|<\|/'
		return "\<tab>"
	elseif exists('&omnifunc') && &omnifunc == ''
		return "\<c-n>"
	else
		return "\<c-n>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"display statusline
function! GetStatusEx()
	let str = ''
	if &ft != ''
		let str = str . '[' . &ft . ']'
	endif
	if has('multi_byte')
		if &fenc != ''
			let str = str . '[' . &fenc . ']'
		elseif &enc != ''
			let str = str . '[' . &enc . ']'
		endif
	endif
	if &ff != ''
		let str = str . '[' . &ff . ']'
	endif
	return str
endfunction
set statusline=%<%f\ %m%r%h%w%=%{GetStatusEx()}\ \ %l,%c%V%8P
set laststatus=2

filetype on
filetype indent on
filetype plugin on

autocmd FileType php source ~/MY-RCFILES/vim-plugin/vim-language/php.vim
autocmd FileType python source ~/MY-RCFILES/vim-plugin/vim-language/python.vim
autocmd FileType ruby source ~/MY-RCFILES/vim-plugin/vim-language/ruby.vim
autocmd FileType javascript source ~/MY-RCFILES/vim-plugin/vim-language/javascript.vim
