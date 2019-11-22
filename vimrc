autocmd!

source ~/MY-RCFILES/vim-plugin/vim-surround/surround.vim
"source ~/MY-RCFILES/vim-plugin/vim-pathogen/pathogen.vim
source ~/MY-RCFILES/vim-plugin/vim-javascript/javascript.vim
source ~/MY-RCFILES/vim-plugin/vim-autocursor/autocursor.vim
"call pathogen#runtime_append_all_bundles()

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
set paste

:nmap <C-J> <C-W>j
:nmap <C-K> <C-W>k
:nmap <C-H> <C-W>h
:nmap <C-L> <C-W>l

vnoremap J 3j
vnoremap K 3k
vnoremap ss s
vnoremap p pgvy

nnoremap <S-h> b
nnoremap <S-l> w
nnoremap r <C-R>
nnoremap <C-n> :<C-u>set number!<CR>
nnoremap <C-p> :<C-u>set paste!<CR>
nnoremap <Space>. :<C-u>tabnew $HOME/MY-RCFILES/vimrc<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
nnoremap <expr> <Space>h ':<C-u>help ' . expand('<cword>') . '<CR>'
nnoremap <Space>- mzgg=G`z
nnoremap <Space>=  mz`[V`]=`z
nnoremap <CR> O
nnoremap <S-t> :tabnew
nnoremap <Space>gd :!git diff %<CR>

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

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle      'Blackrush/vim-gocode'
NeoBundle      'thinca/vim-quickrun'
NeoBundle      'rust-lang/rust.vim'
NeoBundle      'leafgarland/typescript-vim'
call neobundle#end()

filetype on
filetype indent on
filetype plugin on

autocmd FileType php source ~/MY-RCFILES/vim-plugin/vim-language/php.vim
autocmd FileType python source ~/MY-RCFILES/vim-plugin/vim-language/python.vim
autocmd FileType ruby source ~/MY-RCFILES/vim-plugin/vim-language/ruby.vim
autocmd FileType javascript source ~/MY-RCFILES/vim-plugin/vim-language/javascript.vim
autocmd FileType puppet source ~/MY-RCFILES/vim-plugin/vim-language/puppet.vim
autocmd FileType scheme source ~/MY-RCFILES/vim-plugin/vim-language/gosh.vim
autocmd FileType go source ~/MY-RCFILES/vim-plugin/vim-language/golang.vim
autocmd FileType rust source ~/MY-RCFILES/vim-plugin/vim-language/rust.vim

