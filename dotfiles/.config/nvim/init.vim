" Must set it before referenced since it gets expanded at use
let mapleader = "\<Space>"

"#############"
"## Plugins ##"
"#############"
" :messages and :checkhealth are your friend for plugin debugs

" Automatically install vim-plug and all plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl --create-dirs -fLo ~/.local/share/nvim/site/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " This seems to error with deoplete not installed or something
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" [[ Six and MOMO ]]
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'davidhalter/jedi-vim' " , {'for': 'python'} python highlighting, goto, etc. Using zchee/deoplete-jedi for completion though
Plug 'zchee/deoplete-jedi' " , {'for': 'python'} async python completion
Plug 'bfredl/nvim-miniyank' " Fix block paste in neovim when clipboard=unnamed
Plug 'bling/vim-airline' " minimal status line
Plug 'chrisbra/csv.vim' " Fancy CSV viewing
Plug 'christoomey/vim-tmux-navigator' " use ctrl-(h/j/k/l) to seamlessly navigate vim splits or tmux panes
" Plug 'elzr/vim-json' " adds json specific highlighting (instead of just js)
Plug 'vim-scripts/Tagbar' " Shows ctags (ex for go-to definition)
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
Plug 'scrooloose/nerdtree' " file explorer
Plug 'tmux-plugins/vim-tmux' " tmux syntax highlighting and a few others
Plug 'tpope/vim-repeat' " allows plugin actions to be repeated as a whole with '.' instead of last native action
Plug 'vim-airline/vim-airline-themes' " Use Solarized Light theme for statusline
Plug 'terryma/vim-expand-region' " expand visual selection by repeating key hit

" [[ Six not MOMO ]]
Plug 'luk400/vim-jukit', {'for': ['python', 'notebook']}

Plug 'BurntSushi/ripgrep'
" Plug '/opt/homebrew/bin/fzf' " Use the brew installed fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sharkdp/fd'
Plug 'nvim-lua/plenary.nvim' " dep for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }

Plug 'ervandew/supertab'
Plug 'rafi/awesome-vim-colorschemes' "colorthemes
Plug 'tpope/vim-surround' "Surround text v(highlight)S<character>
Plug 'tpope/vim-fugitive' "Vim git plugin
Plug 'tpope/vim-rhubarb' "Vim github plugin
Plug 'mattboehm/vim-unstack' "Unfold a stacktrace into vim-splits
Plug 'lymslive/dbext' "THE BEST DB INTERFACE
Plug 'easymotion/vim-easymotion' "Space+vim-motion - quick jumps
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine' "Marks indentation levels with a character
Plug 'vorillaz/devicons' "Next level bling
Plug 'shime/vim-livedown' "markdown server

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-orgmode/orgmode' " , {'for': 'org'}

" [[ ICEBOX ]]
"Plug 'hrj/vim-DrawIt' "VERY useful for diagramming
"Plug 'xsunsmile/showmarks'
"Plug 'bling/vim-bufferline' " Show the buffers (and number) in status bar
"Plug 'chrisbra/Recover.vim' " allow diff from existing .swp files - doesn't work well with nvim
"Plug 'altercation/vim-colors-solarized' " soloraized color scheme
"Plug 'dag/vim-fish' " Add fish syntax support
"Plug 'kana/vim-textobj-entire' " used for vim-expand-region config
"Plug 'kana/vim-textobj-indent' " used for vim-expand-region config
"Plug 'kana/vim-textobj-user'   " used for vim-expand-region config
"Plug 'mbbill/undotree' " friendly view for change history
"Plug 'terryma/vim-multiple-cursors' " Sublime Text style multi-edit
"Plug 'tpope/vim-commentary' " Auto comment line (gcc) or visual block (gc)
"Plug 'tpope/vim-sensible' " some sensible vim defaults, though I think most are overwritten below.
"Plug 'tpope/vim-sleuth' " Auto detect space/indent
" [[ MOMO NOT SIX ]]
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " lots of go helpers
" Plug 'zchee/deoplete-go', { 'do': 'make' } " async go completion
"
call plug#end()

" Source plugin config files
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor

for f in split(glob('~/.config/nvim/functions/*.vim'), '\n')
    exe 'source' f
endfor

"####################"
"##    MOMO VIM    ##"
"####################"

"set background=light
set clipboard+=unnamed " Uses system clipboard
"set cursorline " highlight the line cursor is on
set expandtab " use spaces
"set foldmethod=indent " fold on indents
set ignorecase " Don't worry about case when searching
set lazyredraw " don't redraw the screen when executing non typed commands (like macros)
set matchtime=3 " Tenths of seconds to showmatch
set modelines=0 " Modelines auto loads vim commands in files. Security vuln and don't need
set mouse=a " Enables mouse in all modes, such as scroll and highlight
set nofoldenable " disable folding by default when a fold type is specified
set nojoinspaces " Don't use double spaces when joining lines ending with periods
set number " Shows line numbers
set relativenumber " show numbers as relative to current line.
set scrolloff=10 " Minimum number of lines before/after cursor at top/bottom
set shiftwidth=0 " Number of characters to insert with << or >>, with 0 it defaults to tabstop
set showmatch " Jump to the corresponding enclosing char when inserting new ones (ex paren, bracket, etc)
set smartcase " Ignores search case except when you use a caps
set tabstop=4 " Number of characters/spaces a tab appears as
set shiftwidth=4 " Number of characters/spaces a tab appears as
set textwidth=120 " Start new lines at 120 characters automatically or re-wrap to 120 with gq
set undofile " Store change history between file sessions
set visualbell " don't beep, ex when hitting escape in command mode
" set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

autocmd bufread *.md setlocal conceallevel=0 " Don't hide syntax symbols like _
autocmd bufread *.py setlocal textwidth=120 " 88 to Match Black config.
autocmd bufread *.tsx set syntax=javascript
autocmd bufread *.sql.tmpl set syntax=sql
" autocmd bufread *.org set syntax=sql

"" faster quit, write, and exit
"nnoremap <Leader>q :q<CR>
"nnoremap <Leader>w :w<CR>
"nnoremap <Leader>x :x<CR>
" Use comma to clear messages
nnoremap <silent> , :silent noh<Bar>echo<CR>
" position search results in center of the page
nnoremap n nzzzv
nnoremap N Nzzzv
" move up/down within wrapped lines (can use arrow keys for \n nav)
nmap j gj
nmap k gk
" Shortcut for :s///g
" nmap S :%s//g<LEFT><LEFT> " nice but interferes with tpope/vim-surround
" xmap S :s//g<LEFT><LEFT>
" Shortcut for :s/<last match>//g
" nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'
" xmap <expr> M ':s/' . @/ . '//g<LEFT><LEFT>'

" choose the highlighted match without inserting newline - not required for an auto-selected match
function! s:select_without_newline()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <silent> <CR> <C-r>=<SID>select_without_newline()<CR>

"####################"
"##    SIX VIM     ##"
"####################"
"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost init.vim source %

"[[ SETTINGS ]]
set path+=** " Recursive search for files with vims native 'gf' (goto file)
set hlsearch " Make search case insensitive
set incsearch
set ignorecase
set smartcase
set nobackup " Disable stupid backup and swap files - they trigger too many events for file system watchers
set nowritebackup
set noswapfile
set laststatus=2 "Status line - show the percentage through a file

"[[ SYNTAX HIGHLIGHTING COLORS ]]
syntax on
" highlight Comment ctermfg='darkgrey'
" highlight Number ctermfg='blue'
" highlight String ctermfg='cyan'
" highlight Float ctermfg='blue'
highlight Fold cterm='underline'
hi clear Folded
highlight Folded cterm='underline'
highlight Search cterm=bold ctermbg='grey' guibg='lightgrey'
highlight Todo term=reverse ctermbg='grey' guibg='lightgrey'

"[[ SIX MOTION ]]
noremap H <home>
vnoremap H <home>
noremap L <end>
vnoremap L <end>
noremap <c-k> {
vnoremap <c-k> {
noremap <c-j> }
vnoremap <c-j> }

"[[ SPLITS ]]
"SPLIT SWITCH
" noremap <c-j> <c-w>j
" noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"SPLIT RESIZE
nmap <S-Up> <C-w>-
nmap <S-Down> <C-w>+
nmap <S-Left> <C-w><
nmap <S-Right> <C-w>>

"[[ BUFFERS ]]
" Change between files more quickly when editing multiple files
" nnoremap <c-n> <esc>:bprevious<CR>
nnoremap <c-b> <esc>:buffer #<CR>
nnoremap <c-m> <esc>:bnext<CR>
nnoremap B :buffers<CR>:buffer<SPACE>
" nnoremap b :buffers<CR>:buffer<SPACE> "this pisses @momo off too much
" nnoremap O :only<CR>

"[[ INDENT ]]
vnoremap < <gv
vnoremap > >gv

"[[ SAVE ]]
"Fast saves
nnoremap s :update<CR>
nnoremap w ge

"[[ QUIT ]]
"force quit
nnoremap Q :qall!<CR>
"normal quit
nnoremap q :quit<CR>
"soft close buffers
"nnoremap Q :bdelete<CR>
"close all buffers but this one
nnoremap <leader>q <ESC>:w<CR>:%bd<CR>:e#<CR>


"[[ TAGS ]]
set tags=tags; "ctags compatibility

function! UpdateTags()
  execute ":!ctags -R --languages=SQL,SH,Python --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "SQL tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags() "TODO map this to something better than F4

" Jump Between Tags (forwards and back respectively)
nnoremap <C-u> <C-]>
nnoremap <C-i> :tn<CR>
nnoremap <C-y> <C-t>

let g:sql_type_default = 'pgsql'

"[[ TMUX NAVIGATION ]]
nnoremap <M-h> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <M-j> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <M-k> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <M-l> {Right-Mapping} :TmuxNavigateRight<cr>

" Remap +/- to increment and decrement 32
nnoremap + <C-a>
nnoremap - <C-x>

"====[ Toggle visibility of naughty characters ]============
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
set lcs=tab:⇒·,trail:␣,nbsp:~"
highlight InvisibleSpaces ctermfg=Black ctermbg=Black
call matchadd('InvisibleSpaces', '\s\+\%#', 100)

" Spell checking
"change misspelled words FROM getting highlighted to underlined
" z= gives a list of suggestions for misspelled words
" set spell might work too
hi clear SpellBad
hi clear SpellLocal
hi clear SpellCap
hi clear SpellRare
hi SpellBad cterm=underline
hi SpellLocal cterm=underline
hi SpellCap cterm=underline
hi SpellRare cterm=underline
" setlocal spell spelllang=en_us "uncomment this to allow spell-checking
set spell spelllang=en_us "uncomment this to allow spell-checking

noremap <leader>n :nohl<CR>

" [[ PYTHON IDE ]]
" autocmd FileType py noremap <buffer> <C-CR> :!python %<CR>
" noremap <C-CR> :!python %<CR>
autocmd bufread *.py noremap <F12> :!python %<CR>
" map <Leader>b obreakpoint()  # TODO BREAKPOINT<C-c>
autocmd bufread *.py map <Leader>b oimport ipdb; ipdb.set_trace()  # TODO BREAKPOINT<C-c>
