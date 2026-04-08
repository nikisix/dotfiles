" call deoplete#custom#option('smart_case', v:true)
let g:deoplete#enable_at_startup = 1

let g:deoplete#candidate_marks = 30
" Omnifunc (or deoplete?) wants to prepopulate first result and exit by default for some reason
call deoplete#custom#buffer_option('auto_complete', v:false)
set completeopt+=noinsert " Select the first completion automatically
"
" MAP OMNICOMPLETE TO CONTROL-SPACE
inoremap <C-@> <c-x><c-o><c-p>
inoremap <C-Space> <c-x><c-o>
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
