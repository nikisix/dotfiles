"UNDOTREE
nnoremap U :UndotreeToggle<cr>
"function! g:Undotree_CustomMap()
    "nmap <buffer> J <plug>UndotreeGoNextState
    "nmap <buffer> K <plug>UndotreeGoPreviousState
    "nmap <buffer> t <plug>UndotreeTimestampToggle
    "nmap <buffer> C <plug>UndotreeClearHistory
"endfunc
set undodir=~/.vim/undo " Store them all here instead in pwd
set undofile " Store change history between file sessions

"General undo
set undofile
set undodir=~/.undodir
