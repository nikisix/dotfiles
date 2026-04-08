au FileType go nmap <Leader>b  <Plug>(go-build)
au FileType go nmap <Leader>d  <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>e  <Plug>(go-rename)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>i  <Plug>(go-info)
au FileType go nmap <Leader>r  <Plug>(go-run)
au FileType go nmap <Leader>s  <Plug>(go-implements)
au FileType go nmap <Leader>t  <Plug>(go-test)

let g:go_auto_sameids = 1 " Highlight other uses of a variable
let g:go_auto_type_info = 1 " Show variable type in status line
let g:go_fmt_command = 'goimports'
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_metalinter_autosave = 0
