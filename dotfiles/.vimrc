" Must set it before referenced since it gets expanded at use
let mapleader = "\<Space>"

" fish isn't posix compliant
if &shell =~# 'fish$'
  set shell=sh
endif

"#############"
"## Plugins ##"
"#############"

filetype off
set nocompatible " disables vi compatability mode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin 'https://github.com/easymotion/vim-easymotion' " Need to learn more, but it's like vimium's link following
Plugin 'Shougo/neocomplete' " allows completion, such as words, methods, functions, etc.
Plugin 'Shougo/neosnippet' " allows snippet completion
Plugin 'Shougo/neosnippet-snippets' " actual snippets
Plugin 'altercation/vim-colors-solarized' " soloraized color scheme
Plugin 'bling/vim-airline' " minimal status line
Plugin 'chrisbra/Recover.vim' " allow diff from existing .swp files
Plugin 'chrisbra/csv.vim' " Fancy CSV viewing
Plugin 'christoomey/vim-tmux-navigator' " use ctrl-(h/j/k/l) to seamlessly navigate vim splits or tmux panes
Plugin 'dag/vim-fish' " Add fish syntax support
Plugin 'davidhalter/jedi-vim' " python highlighting, goto, etc. Need to learn more and better utilize
Plugin 'elzr/vim-json' " adds json specific highlighting (instead of just js)
Plugin 'fatih/vim-go' " damn good go plugin
Plugin 'haya14busa/incsearch.vim' " improved incremental search, highlights all matches
Plugin 'kana/vim-textobj-entire' " used for vim-expand-region config
Plugin 'kana/vim-textobj-indent' " used for vim-expand-region config
Plugin 'kana/vim-textobj-user'   " used for vim-expand-region config
Plugin 'majutsushi/tagbar' " Shows ctags (ex for go-to definition)
Plugin 'mbbill/undotree' " friendly view for change history
Plugin 'myint/syntastic-extras' " extra syntax checking stuff, such as json, yaml
Plugin 'rking/ag.vim' " Uses ag to search files for a string
Plugin 'scrooloose/nerdtree' " file explorer
Plugin 'scrooloose/syntastic' " syntax checking
Plugin 'terryma/vim-expand-region' " expand visual selection by repeating key hit
Plugin 'tmux-plugins/vim-tmux' " tmux syntax highlighting and a few others
Plugin 'tpope/vim-commentary' " Auto comment line (gcc) or visual block (gc)
Plugin 'tpope/vim-repeat' " allows plugin actions to be repeated as a whole with '.' instad of last native action
Plugin 'tpope/vim-sensible' " some sensible vim defaults, though I think most are overwritten below.
Plugin 'tpope/vim-sleuth' " Auto detect space/indent
Plugin 'vim-airline/vim-airline-themes' " Use Solarized Light theme for statusline

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
syntax enable

"####################"
"## Plugin Options ##"
"####################"

set background=dark
colorscheme solarized

" ## vim-fish
autocmd FileType fish compiler fish

" ## jedi-vim
" let g:jedi#force_py_version=3
let g:jedi#use_splits_not_buffers = "top"

" ## syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0 " don't check on exit
let g:syntastic_javascript_checkers = ['jshint', 'json_tool'] " from myint/syntastic-extras
let g:syntastic_loc_list_height = 3
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_python_python_exec = '/usr/local/bin/python3' " Use python3 for checks, etc
let g:syntastic_yaml_checkers = ['pyyaml'] " from myint/syntastic-extras
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}

" ## vim-json
let g:vim_json_syntax_conceal = 0

" ## Tagbar
nmap <Leader>c :TagbarToggle<CR>

" ## NerdTree
" Close vim if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" ## incsearch.vim
" Replaces default searches to highlight all matches instead of just first
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ## neocomplete
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" choose highlighted match without inserting newline
inoremap <silent> <CR> <C-r>=<SID>select_without_newline()<CR>
function! s:select_without_newline()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_smart_case = 1

" ## neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ## tmux-navigator
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" ### vim-expand-region ###
" Use 'v' for vim-expand-region
vmap v         <Plug>(expand_region_expand)
vmap <Leader>v <Plug>(expand_region_shrink)
" Add support for more levels. Can't comment inside block, so have to outside
" Support nesting of 'around' brackets
" Support nesting of 'around' parentheses
" Support nesting of 'around' braces
" 'inside indent'. Available through https://github.com/kana/vim-textobj-indent
" 'around indent'. Available through https://github.com/kana/vim-textobj-indent
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })

" ## UNDOTREE
nnoremap U :UndotreeToggle<cr>

" ## vim-go ##
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
let $GOPATH = $HOME
let g:go_bin_path = $HOME.'/.vim/gopath/bin'
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1

"####################"
"## Custom Options ##"
"####################"

set clipboard=unnamed " Uses system clipboard
set complete+=kspell " adds spell check hints to keyword completion with C-N/C-P
set cursorline " highlight the line cursor is on
set encoding=utf-8 " Default to utf-8
set expandtab " use spaces
set foldmethod=indent " fold on indents
set hlsearch " highlight matches, use noh to clear (set to comma)
set ignorecase " Don't worry about case when searching
set lazyredraw " don't redraw the screen when executing non typed commands (like macros)
set matchtime=3 " Tenths of seconds to showmatch
set modelines=0 " Modelines auto loads vim commands in files. Security vuln and don't need
set mouse=a " Enables mouse in all modes, such as scroll and highlight
set nofoldenable " disable folding by default
set nojoinspaces " Don't use double spaces when joining lines ending with periods
set number " Shows line numbers
set relativenumber " as relative +/- to current line. With number, shows current line as absolute, and others as relative
set scrolloff=5 " Minimum number of lines before/after cursor at top/bottom
set shiftwidth=0 " Number of characters to insert with << or >>, with 0 it defaults to tabstop
set showmatch " Jump to the corresponding enclosing char when inserting new ones (ex paren, bracket, etc)
set smartcase " Ignores search case except when you use a caps
set spell spelllang=en_us " enable spell checking w/ US English
set tabstop=4 " Number of characters/spaces a tab appears as
set textwidth=120 " Start new lines at 120 characters automatically or re-wrap to 120 with gq
set undodir=~/.vim/undo " Store them all here instead in pwd
set undofile " Store change history between file sessions
set visualbell " don't beep, ex when hitting escape in command mode
set wildmenu " enable command line  completion

autocmd BufRead,BufNewFile *.md setlocal spell " enable spell checking for md files
autocmd BufRead,BufNewFile *.txt setlocal spell " enable spell checking for txt files

" faster quit
nnoremap <Leader>q :q<CR>
" faster exit
nnoremap <Leader>x :x<CR>
" faster write
nnoremap <Leader>w :w<CR>
" Use comma to clear messages
nnoremap <silent> , :silent noh<Bar>echo<CR>
" unfold all
nnoremap F zr
" Fold all
nnoremap f zm
" center search
nnoremap n nzzzv
" center backwards search
nnoremap N Nzzzv

" move down visual row, not line (\n)
nmap j gj
" move up visual row, not line (\n)
nmap k gk

" Doesn't seem to work
" " vp doesn't replace paste buffer
" function! RestoreRegister()
"   let @" = s:restore_reg
"   return ''
" endfunction
" function! s:Repl()
"   let s:restore_reg = @"
"   return "p@=RestoreRegister()\<cr>"
" endfunction
" " Use
" vmap <silent> <expr> p <sid>Repl()

" Stolen from http://howivim.com/2016/fatih-arslan/
function! s:tab_complete()
  " is completion menu open? cycle to next item
  if pumvisible()
    return "\<c-n>"
  endif

  " is there a snippet that can be expanded?
  " is there a placholder inside the snippet that can be jumped to?
  " Still need to use enter to select, and then tab to fill out snippet
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif

  " if none of these match just use regular tab
  return "\<tab>"
endfunction
" Use tab_complete to determine what to do with tabs in insert mode
imap <silent><expr><TAB> <SID>tab_complete()

" https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc#L162
" Shortcut for :s///g
nmap S :%s//g<LEFT><LEFT>
vmap S :Blockwise s//g<LEFT><LEFT>

" Shortcut for :s/<last search>//g
nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'
vmap <expr> M ':s/' . @/ . '//g<LEFT><LEFT>'

"Cursor Changes depending ON mode
"http://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" au! SigUSR1
" au SigUSR1 * source ~/.vimrc
" au SigUSR1 * redraw
