" Close vim if only nerdtree is left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

"NERDTree plugin
"If nerdtree's the only open window when you close vi, then close the nerdtree window too
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""autoload nerdtree, even if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

"Use this if you can't install plugins
"autocmd vimenter * if !argc() | Lexplore | endif
