" Use 'v' for vim-expand-region
vmap v         <Plug>(expand_region_expand)
vmap <Leader>v <Plug>(expand_region_shrink)
" Add support for more levels. Can't comment inside block, so have to outside
" Support nesting of 'around' brackets
" Support nesting of 'around' parentheses
" Support nesting of 'around' braces
" 'inside indent'. From kana/vim-textobj-indent
" 'around indent'. From kana/vim-textobj-indent
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
\ })
