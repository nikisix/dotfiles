"[[ FOLDING ]]
"zM fold all
"zR unfold all
"
" FOLD ON PARENS
" set foldmethod=marker
" set foldmarker=(,)
" BRACKETS
" set foldmarker={,}
"
" PYTHON
" set foldmethod=indent
set nofoldenable
nnoremap f zm
nnoremap F zr
set foldmethod=expr
set foldexpr=FoldMethod(v:lnum)

function! FoldMethod(lnum)
  "get string of current line
  let crLine=getline(a:lnum)

  " check if empty line 
  if empty(crLine) "Empty line or end comment 
    return -1 " so same indent level as line before 
  endif 

  " check if comment 
  let a:data=join( map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")') )
  if a:data =~ ".*omment.*"
    return '='
  endif

  "Otherwise return foldlevel equal to indent /shiftwidth (like if
  "foldmethod=indent)
  else  "return indent base fold
    return indent(a:lnum)/&shiftwidth
endfunction

