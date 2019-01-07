" handle tabs in insert mode specially if a completion menu or snippet is open
function! s:tab_complete()
  if pumvisible()
    " a completion menu open is open - cycle to the next item
    return "\<c-n>"
  elseif neosnippet#expandable_or_jumpable()
    " Either a snippet can be expanded or a placeholder can be jumped to
    " Still need to use enter to select, and then tab to fill out snippet
    return "\<Plug>(neosnippet_expand_or_jump)"
  else
    return "\<tab>"
  endif
endfunction
imap <silent><expr><TAB> <SID>tab_complete()
