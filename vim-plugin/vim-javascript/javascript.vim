" DERIVED FROM:
"
" Vim indent file
" Language: JavaScript
" Author: id:gnarl(http://d.hatena.ne.jp/gnarl)
" URL: -
" Last Change: 2007 aug 4
"
" oritinal author: Ryan (ryanthe) Fabella <ryanthe at gmail dot com>
" original file: http://www.vim.org/scripts/script.php?script_id=1936

" MODIFIED BY:
" h1mesuke (http://d.hatena.ne.jp/h1mesuke/20100701/p1)

setlocal indentexpr=GetJsIndent()
setlocal indentkeys=0{,0},0),0:,!^F,o,O,e,*<Return>,=*/

" normalize newlines
if &fileformat ==? "unix"
  silent! %s/\r$//g
endif

if 1 " release only
  if exists('b:did_indent')
    finish
  endif
  let b:did_indent = 1
" only define the functions once per vim session
  if exists("*GetJsIndent")
    finish
  endif
endif

function! GetJsIndent()
  let boc = '\(^\| \)//.*'

" get the context
  let line = substitute(getline(v:lnum), boc, '', '')

  let prev_lnum = prevnonblank(v:lnum - 1)
  if prev_lnum == 0
    return 0
  endif
  let prev_line = substitute(getline(prev_lnum), boc, '', '')
  let prev_ind = indent(prev_lnum)

  let pre2_lnum = prevnonblank(prev_lnum - 1)
  let pre2_line = ''
  let pre2_ind = 0
  if pre2_lnum != 0
    let pre2_line = substitute(getline(pre2_lnum), boc, '', '')
    let pre2_ind = indent(pre2_lnum)
  endif

  let pre3_lnum = prevnonblank(pre2_lnum - 1)
  let pre3_line = ''
  let pre3_ind = 0
  if pre3_lnum != 0
    let pre3_line = substitute(getline(pre3_lnum), boc, '', '')
    let pre3_ind = indent(pre3_lnum)
  endif

  let ind = indent(prev_lnum)

  let bol = '^\s*'
  let eol = '\s*$'
  let bob = '[{([]'
  let eob = '[})\]]'
  let ident = '[a-zA-Z_][a-zA-Z0-9_]*'

" block open/close
  if prev_line =~ bob.eol
    let ind += &sw
  endif
  if line =~ bol.eob
    let ind -= &sw
  endif

" if/else/for without {}
  let ief = '\(if\s*(.*)\|\(}\s*\)\=else\|for\s*(.*)\)'
  if prev_line =~ bol.ief.eol
    let ind += &sw
  endif
  if prev_line !~ bol.ief.eol && pre2_line =~ bol.ief.eol
    let ind -= &sw
  endif
  if prev_line !~ bol.ief.eol && pre2_line =~ bol.ief.eol && pre3_line =~ bol.ief.eol
    let ind -= &sw
  endif

" case/default label
  let label = bol.'\(case\s*\S\+\s*:\|default:\s*$\)'
  if line =~ label && prev_line !~ label
    let ind -= &sw
  endif
  if prev_line =~label && line !~ label
    let ind += &sw
  endif

" newline after an operator
  let op = '[+\-*/%=~&|.]'
  if prev_line =~ op.eol && pre2_line !~ op.eol
    let ind += &sw
  endif
  if prev_line !~ op.eol && pre2_line =~ op.eol
    let ind -= &sw
  endif

" newline after a comma in the expr list
  let eoe = ','
  let prev_nopen = s:count_pat(prev_line, bob)
  let prev_nclose = s:count_pat(prev_line, eob)
  if prev_line =~ eoe.eol && prev_nopen > prev_nclose
    let ind += &sw
  endif
  if pre2_line =~ eoe.eol && prev_nopen < prev_nclose &&
        \ prev_ind >= pre2_ind
    let ind -= &sw
  endif

  return ind
endfunction

function! s:count_pat(str, pat)
  return len(split(a:str, a:pat, 1)) - 1
endfunction

" vim: filetype=vim


