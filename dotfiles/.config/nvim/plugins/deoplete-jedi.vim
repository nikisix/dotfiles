" Bump the timeout for things like pandas - mostly used the first time as cached afterwards
let g:deoplete#sources#jedi#server_timeout = 60
" Use brew python since linters and neovim are installed
"
" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python_host_prog = '/usr/local/bin/python'
"
" TODO not sure why doesn't work
" let g:python3_host_prog = system("which python3")
" let g:python_host_prog = system("which python")
" Works
let g:python3_host_prog = '/Users/six/envs/env1/bin/python3'
let g:python_host_prog = '/Users/six/envs/env1/bin/python'
