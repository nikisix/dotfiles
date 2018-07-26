call deoplete#custom#option('smart_case', v:true)
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert " Select the first completion automatically

" TODO: Think about only enabling deoplete for registered files (python, go, etc)
"   with vim-plug: 'for': ['python', 'go']
" Need to check when python is started. Ex: does deoplete-jedi start a python for non python files? Limit that.
" If deoplete doesn't do anything helpful for files w/o plugins, disable it too
