" Must set it before referenced since it gets expanded at use
let mapleader = "\<Space>"

"" fish isn't posix compliant
"if &shell =~# 'fish$'
  "set shell=sh
"endif

"#############"
"## Plugins ##"
"#############"

" Automatically install vim-plug and all plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl --create-dirs -fLo ~/.local/share/nvim/site/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " This seems to error with deoplete not installed or something
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'bling/vim-bufferline' " Show the buffers (and number) in status bar
" Plug 'chrisbra/Recover.vim' " allow diff from existing .swp files - doesn't work well with nvim
" Plug 'easymotion/vim-easymotion' " Need to learn more, but it's like vimium's link following
Plug '/usr/local/opt/fzf' " Use the brew installed fzf
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neosnippet-snippets' " actual snippets
"Plug 'Shougo/neosnippet.vim' " allows snippet completion
"Plug 'altercation/vim-colors-solarized' " soloraized color scheme
Plug 'bfredl/nvim-miniyank' " Fix block paste in neovim when clipboard=unnamed
Plug 'bling/vim-airline' " minimal status line
Plug 'chr4/nginx.vim' " Nginx conf file syntax highlighting
Plug 'chrisbra/csv.vim' " Fancy CSV viewing
Plug 'christoomey/vim-tmux-navigator' " use ctrl-(h/j/k/l) to seamlessly navigate vim splits or tmux panes
" Plug 'dag/vim-fish' " Add fish syntax support
Plug 'davidhalter/jedi-vim' " python highlighting, goto, etc. Using zchee/deoplete-jedi for completion though
Plug 'elzr/vim-json' " adds json specific highlighting (instead of just js)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " lots of go helpers
"Plug 'kana/vim-textobj-entire' " used for vim-expand-region config
"Plug 'kana/vim-textobj-indent' " used for vim-expand-region config
"Plug 'kana/vim-textobj-user'   " used for vim-expand-region config
Plug 'vim-scripts/Tagbar' " Shows ctags (ex for go-to definition)
"Plug 'mbbill/undotree' " friendly view for change history
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace
Plug 'scrooloose/nerdtree' " file explorer
"Plug 'terryma/vim-expand-region' " expand visual selection by repeating key hit
"Plug 'terryma/vim-multiple-cursors' " Sublime Text style multi-edit
Plug 'tmux-plugins/vim-tmux' " tmux syntax highlighting and a few others
"Plug 'tpope/vim-commentary' " Auto comment line (gcc) or visual block (gc)
Plug 'tpope/vim-repeat' " allows plugin actions to be repeated as a whole with '.' instad of last native action
"Plug 'tpope/vim-sensible' " some sensible vim defaults, though I think most are overwritten below.
Plug 'tpope/vim-sleuth' " Auto detect space/indent
Plug 'vim-airline/vim-airline-themes' " Use Solarized Light theme for statusline
Plug 'w0rp/ale' " async linting, etc
Plug 'zchee/deoplete-go', { 'do': 'make' } " async go completion
Plug 'zchee/deoplete-jedi' " async python completion

Plug 'tpope/vim-surround' "Surround text v(highlight)S<character>
Plug 'tpope/vim-fugitive' "Vim git plugin
Plug 'mattboehm/vim-unstack' "Unfold a stacktrace into vim-splits
Plug 'vim-scripts/dbext.vim' "THE BEST DB INTERFACE
Plug 'easymotion/vim-easymotion' "Space+vim-motion - quick jumps
Plug 'vorillaz/devicons' "Next level bling
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine' "Marks indentation levels with a character
"Plug 'hrj/vim-DrawIt' "VERY useful for diagramming
"Plug 'xsunsmile/showmarks'

call plug#end()

" Source plugin config files
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor

" TODO move functions below to: nvim/functions

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
"set relativenumber " show numbers as relative to current line.
set scrolloff=10 " Minimum number of lines before/after cursor at top/bottom
set shiftwidth=0 " Number of characters to insert with << or >>, with 0 it defaults to tabstop
set showmatch " Jump to the corresponding enclosing char when inserting new ones (ex paren, bracket, etc)
set smartcase " Ignores search case except when you use a caps
set tabstop=4 " Number of characters/spaces a tab appears as
set textwidth=120 " Start new lines at 120 characters automatically or re-wrap to 120 with gq
set undofile " Store change history between file sessions
set visualbell " don't beep, ex when hitting escape in command mode

autocmd bufreadpre *.md setlocal conceallevel=0 " Don't hide syntax symbols like _
autocmd bufreadpre *.py setlocal textwidth=88 " Match Black config

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
nmap S :%s//g<LEFT><LEFT>
xmap S :s//g<LEFT><LEFT>
" Shortcut for :s/<last match>//g
nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'
xmap <expr> M ':s/' . @/ . '//g<LEFT><LEFT>'

" choose the highlighted match without inserting newline - not required for an auto-selected match
function! s:select_without_newline()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <silent> <CR> <C-r>=<SID>select_without_newline()<CR>

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


"####################"
"##    SIX VIM     ##"
"####################"
"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

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

"[[ SYNTAX HIGHLIGHTING ]]
syntax on
highlight Comment ctermfg='darkgrey'
highlight Number ctermfg='blue'
highlight String ctermfg='cyan'
highlight Float ctermfg='blue'
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
noremap <leader>k <pageup>
"vnoremap K <pageup>
" TODO join
noremap <leader>j <pagedown>
"vnoremap J <pagedown>  "TODO }

"[[ SPLITS ]]
"SPLIT SWITCH
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"SPLIT RESIZE
nmap <S-Up> <C-w>-
nmap <S-Down> <C-w>+
nmap <S-Left> <C-w><
nmap <S-Right> <C-w>>

"[[ BUFFERS ]]
" Change between files more quickly when editing multiple files
nnoremap <c-n> <esc>:bprevious<CR>
nnoremap <c-b> <esc>:buffer #<CR>
nnoremap <c-m> <esc>:bnext<CR>
nnoremap B :buffers<CR>:buffer<SPACE>
"nnoremap b :buffers<CR>:buffer<SPACE> "this pisses @momo off too much
nnoremap O :only<CR>

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
set tags=tags "ctags compatibility

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

"Uppercase SQL
function! SQLtoUPPER()
    execute ":%s/\\v(\\s+)create(\\s+)/\\1CREATE\\2/g"
    execute ":%s/\\v(\\s+)not(\\s+)/\\1NOT\\2/g"
    execute ":%s/\\v(\\s+)on(\\s+)/\\1ON\\2/g"
    execute ":%s/\\v(\\s+)as(\\s+)/\\1AS\\2/g"
    execute ":%s/\\v(\\s*)where(\\s+)/\\1WHERE\\2/g"
    execute ":%s/\\v(\\s*)select(\\s+)/\\1SELECT\\2/g"
    execute ":%s/\\v(\\s*)inner(\\s+)/\\1INNER\\2/g"
    execute ":%s/\\v(\\s*)join(\\s+)/\\1JOIN\\2/g"
    execute ":%s/\\v(\\s*)from(\\s+)/\\1FROM\\2/g"
    execute ":%s/\\v(\\s*)cross(\\s+)/\\1CROSS\\2/g"
    execute ":%s/\\v(\\s*)with(\\s+)/\\1WITH\\2/g"
endfunction
"todo change this to a sql-file-only command
nnoremap <leader>u :call SQLtoUPPER()<CR>


"[[ FOLDING ]]
"zM fold all
"zR unfold all
"set foldmethod=indent
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
setlocal spell spelllang=en_us "uncomment this to allow spell-checking

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <leader>n :nohl<CR>
map <Leader>b obreakpoint()  # TODO BREAKPOINT<C-c>

" Commenting blocks of code.
autocmd FileType *                  let b:comment_leader = '# '
autocmd FileType c,cpp,java,scala   let b:comment_leader = '// '
autocmd FileType js,javascript      let b:comment_leader = '// '
autocmd FileType octave             let b:comment_leader = '% '
autocmd FileType sh,ruby,python     let b:comment_leader = '# '
autocmd FileType conf,fstab         let b:comment_leader = '# '
autocmd FileType text               let b:comment_leader = '# '
autocmd FileType tex                let b:comment_leader = '% '
autocmd FileType mail               let b:comment_leader = '> '
autocmd FileType vim                let b:comment_leader = '" '
autocmd FileType sql                let b:comment_leader = '-- '
noremap <silent> <leader>c :<C-B>silent <C-E>s/\v([^ \t])/<C-R>=escape(b:comment_leader,'\/')<CR>\1/<CR>:nohlsearch<CR>
noremap <silent> <leader>C :<C-B>silent <C-E>s/\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Title sections
noremap <silent> <leader>t :s/^/[[ /e<CR>:nohlsearch<CR> :s/$/ ]]/e<CR>:nohlsearch<CR>
