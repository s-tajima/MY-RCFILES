let php_folding=1
highlight Folded ctermfg=blue
highlight FoldColumn ctermfg=blue

nnoremap <Space>e :w<CR>:<C-u>!php %<CR>
nnoremap <Space>t :w<CR>:<C-u>!phpunit %<CR>
map @r Dko<esc>pI
map @v veyovar_dump(<esc>pa);<esc>==:w<CR>
map @V veykovar_dump(<esc>pa);<esc>==:w<CR>
map @l veyo_log(<esc>pa);<esc>==:w<CR>
map @L veyko_log(<esc>pa);<esc>==:w<CR>
map @i veyoif(<esc>pa){<CR>}<esc>Vk=:w<CR>o
map @I veyoif(){<CR>}<esc>Vk=:w<CR>wa
map @f veyoforeach(){<CR>}<esc>Vk=:w<CR>wa

ab #s #edited by Satoshi Tajima <C-R>=strftime("%Y-%m-%d %T")<CR>
ab //s /*********************************************************
ab //e  ********************************************************/

ab #t $this->

