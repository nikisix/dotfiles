 " nickyVI
" Inspirations are listed throughout via links including the following:
" Martin Brochhaus
"

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
 let mapleader = " "
 "let localmapleader = "\\"

"===================VUNDLE========================================
"Install with:  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required


"ConqueTerm Warning
autocmd! CursorHoldI
autocmd! CursorMovedI

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

 "CODE COMPLETION
 Plugin 'davidhalter/jedi-vim'

 "ORGMODE
 Plugin 'jceb/vim-orgmode'
 Plugin 'mattn/calendar-vim'
 Plugin 'tpope/vim-speeddating'
 Plugin 'jacquesbh/vim-showmarks'
 Plugin 'vim-scripts/Tagbar'
 "Plugin 'vim-scripts/utl.vim'
 "Plugin 'vim-scripts/taglist.vim'
 "Plugin 'vim-scripts/repeat.vim'
 "Plugin 'vim-scripts/narrow_region'
 "Plugin 'vim-scripts/SyntaxRange'

 "GENERAL USED
 Plugin 'vorillaz/devicons'
 Plugin 'mileszs/ack.vim'
 Plugin 'wolfpython/cscope_map.vim'
 Plugin 'vim-scripts/dbext.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'mattboehm/vim-unstack'
 Plugin 'tpope/vim-surround'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'bling/vim-bufferline'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'christoomey/vim-tmux-navigator'
 Plugin 'Yggdroot/indentLine'

 "TOGGLED
 "Plugin 'xsunsmile/showmarks'
 "Plugin 'mbbill/undotree'
 "Plugin 'vim-syntastic/syntastic'
 Plugin 'tpope/vim-fugitive'
 Plugin 'ctrlpvim/ctrlp.vim'
 "Plugin 'shime/vim-livedown'
 "Plugin 'hrj/vim-DrawIt'
 Plugin 'vim-scripts/csv.vim'
 "Plugin 'jphustman/Align.vim' "slows vim down substantially

"ICEBOX
 "Plugin 'jmcantrell/vim-virtualenv'
 "Plugin 'vim-scripts/showmarks' " think this is worse than the other one
 "Plugin 'Shougo/neocomplete.vim'
 "Plugin 'Valloric/YouCompleteMe'
 "Plugin 'ambv/black' " python code formatter
 "Plugin 'zirrostig/vim-schlepp'
 "Plugin 'cosminadrianpopescu/vim-sql-workbench'
 "Plugin 'vim-scripts/SQLUtilities'
 "Plugin 'edkolev/tmuxline.vim'
 "Plugin 'lifepillar/pgsql.vim'
 "Plugin 'shinokada/SWTC.vim'
 "Plugin 'carlobaldassi/ConqueTerm'
 "Plugin 'itchyny/calendar.vim'
 "Plugin 'jvirtanen/vim-octave'
 "Plugin 'vim-scripts/Command-T'
 "Plugin 'vim-scripts/EasyGrep'
 "Plugin 'ervandew/supertab'
 "Plugin 'gianarb/notify.vim'
 "Plugin 'tpope/vim-dispatch'
 "Plugin 'jalvesaq/Nvim-R'

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean
"- confirms removal of unused plugins; append `!` to
" auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
 "--------------------PLUGIN CONFIG----------------------------------------------
"
"INDENT LINE
"let g:indentLine_char = '│'
let g:indentLine_char = '.'

"TMUX-NAVIGATOR
"
"
""""""""""""" CSCOPE-VIM key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    ""   'd'   called: find functions that function under cursor calls

"SQL-WORKBENCH
"let g:sw_exe='/Applications/Workbench-Build123.4/sqlwbconsole.sh'
"let g:sw_config_dir='~/.sqlworkbench'
"
"AG-VIM
let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

"DBEXT
"Adding connection profiles is the best way to use dbext, :h dbext.txt has lots of examples of different profiles for different databases.
"<leader>sbp - connect to a sql db 
"<leader>slt - SQL List Table - lists all of the tables of the db
"<leader>sdt - SQL Describe Table - describes the table whose name is under your cursor
"<leader>se  - SQL Execute - executes the line your cursor is ON (command mode) or all selected text (visual mode)
"autocmd VimEnter * DBCompleteTables
"autocmd filetype sql :DBCompleteTables  "this causes result window not to display on .sql files
let g:dbext_default_profile_stacked='type=SQLSRV:host=buildpro-ft.database.windows.net:port=1433:dbname=buildpro-ml:user=nick.w.tomasino'
let g:dbext_default_profile_warehouse='type=PGSQL:host=localhost:port=5432:dbname=warehouse:user=postgres'
let g:dbext_default_profile_floppy='type=PGSQL:host=192.168.1.103:port=5432:dbname=propdata:user=postgres'
let g:dbext_default_profile_aa='type=PGSQL:host=dev-vpc-redshiftdev100.cqxlseythtmd.us-east-1.redshift.amazonaws.com:port=5439:dbname=yotabites:user=aa_yotabites_dev'
let g:dbext_default_profile_strawhecker='type=PGSQL:host=35.232.183.196:port=5432:dbname=strawhecker:user=postgres'
let g:dbext_default_profile_airflow='type=PGSQL:host=35.232.183.196:port=5432:dbname=airflow:user=airflow'
let g:dbext_default_prompt_for_variables=0
let g:dbext_default_DBI_commit_on_disconnect = 0
"let g:dbext_default_window_use_horiz = 0  " Use vertical split
let g:dbext_default_window_width = 120
let g:dbext_default_window_increment = 50



"
"Nvim-R
let R_assign = 0
"autocmd FileType r nmap <C-CR> <Plug>RSendLine "can't get this to work
"nmap <C-CR> <Plug>RSendLine "can't get this to work

"ORGMODE
let g:org_agenda_files = ['~/*.org']
"let g:org_agenda_files = ['~/worklog.org', '~/academic-worklog.org', '~/troost-worklog.org']
"let g:org_agenda_files = ['~/academic-worklog.org']
"let g:org_agenda_files = ['~/worklog.org']
autocmd FileType org :set colorcolumn=120
autocmd FileType org :set textwidth=120

"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
"augroup CalendarKey
"    autocmd!
"    autocmd FileType calendar nmap <buffer> f <Plug>(calendar_close_task)
"    "autocmd FileType calendar nunmap <buffer> {key}
"augroup END


"BLACK python code formatter
 "autocmd BufWritePre *.py execute ':Black'

""NEOCOMPLETE
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#enable_smart_case = 1
"" choose highlighted match without inserting newline
"inoremap <silent> <CR> <C-r>=<SID>select_without_newline()<CR>
"function! s:select_without_newline()
  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction

"SYNTASTIC
"standard toggle
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=4

"Autoalert
""let g:syntastic_python_pylint_post_args="--max-line-length=100"
""let g:syntastic_python_python_exec = '/usr/local/bin/python3' " Use python3 for checks, etc  TODO
"let g:syntastic_python_checkers = ['python', 'pylint']
""let g:syntastic_python_pylint_exec = '/usr/local/bin/pylint'
"let g:syntastic_python_pylint_exec = '/Users/nicktomasino/.virtualenvs/analytics/bin/pylint'
"let g:syntastic_python_pylint_args = '--rcfile=/Users/nicktomasino/code/data_analytics_f20180410/pylintrc'
"let g:syntastic_python_pylint_tail = '2>/dev/null'
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


"AIRLINE
""let g:airline#extensions#syntastic#enabled = 1
""let g:airline_section_a       " (mode, crypt, paste, spell, iminsert)
"let g:airline_section_b = 0      " (hunks, branch)
""let g:airline_section_c      " (bufferline or filename)
"let g:airline_section_gutter = 0  " (readonly, csv)
"let g:airline_section_x = 0      " (tagbar, filetype, virtualenv)
"let g:airline_section_y = 1      " (fileencoding, fileformat)
"let g:airline_section_z = 1      " (percentage, line number, column number)
"let g:airline_section_error = 1  " (ycm_error_count, syntastic-err, eclim)
"let g:airline_section_warning = 1 " (ycm_warning_count, syntastic-warn, whitespace)
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

"ConqueTerm
"allow window switching while conque is still in insert mode
"let g:ConqueTerm_CWInsert = 0
"let g:ConqueTerm_SendVisKey = '<F9>'
"nnoremap <C-m> V"<F9>"

"NERDTree plugin
"If nerdtree's the only open window when you close vi, then close the nerdtree window too
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""load nerdtree automatically when vi starts
""autocmd vimenter * NERDTree

""autoload nerdtree, even if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd vimenter * if !argc() | Lexplore | endif

"autoload Tagbar
"autocmd vimenter * | Tagbar 
"autocmd vimenter * if (&ft !~ 'text') | Tagbar
"autocmd vimenter * if index(['text','sql'], &ft) < 0 | Tagbar
"autocmd vimenter * if index(['text'], &ft) < 0 | Tagbar
"autocmd FileType text | Tagbar
 nnoremap T :Tagbar<CR>
 let g:tagbar_sort = 0

"SHOW MARKS (jacquesbh/vim-showmarks)
set updatetime=2000
nnoremap <leader>m :ShowMarksOnce<cr>

"UNDOTREE
nnoremap U :UndotreeToggle<cr>
"function! g:Undotree_CustomMap()
    "nmap <buffer> J <plug>UndotreeGoNextState
    "nmap <buffer> K <plug>UndotreeGoPreviousState
    "nmap <buffer> t <plug>UndotreeTimestampToggle
    "nmap <buffer> C <plug>UndotreeClearHistory
"endfunc
set undodir=~/.vim/undo " Store them all here instead in pwd
set undofile " Store change history between file sessions

"General undo
set undofile
set undodir=~/.undodir

" YCM needs this to work:
"   let g:ycm_path_to_python_interpreter = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
"  let g:ycm_path_to_python_interpreter = '/usr/bin/python2.6'
" let g:ycm_path_to_python_interpreter = '/Users/ntomasino/anaconda3/bin/'

"YouCompleteMe Debugging
" let g:ycm_server_keep_logfiles = 0
" let g:ycm_server_log_level = 'debug'
" let g:ycm_auto_trigger = 1
" "let g:ycm_path_to_python_interpreter = '/Users/ntomasino/anaconda/bin/python'
" let g:ycm_filetype_blacklist = {}

" LIVEDOWN
" launch the Livedown server and preview your markdown file
":LivedownPreview
" stop the Livedown server
":LivedownKill
" launch/kill the Livedown server
":LivedownToggle

" Schlepp config
 "vmap <unique> <up>    <Plug>SchleppUp
 "vmap <unique> <down>  <Plug>SchleppDown
 "vmap <unique> <left>  <Plug>SchleppLeft
 "vmap <unique> <right> <Plug>SchleppRight

"pgsql plugin
"      \ ? \"\<c-c>a"  delete backslash escaping quote
let g:sql_type_default = 'pgsql'
imap <expr><silent><buffer> <tab> pumvisible()
    \ ? "\<c-n>"
    \ : (col('.')>1 && (matchstr(getline('.'),
        \ '\%' . (col('.')-1) . 'c.') =~ '\S')
      \ ? "\<c-x><c-o>"
      \ : "\<tab>"
      \ )

inoremap <expr><silent><buffer> <s-tab>
   \ pumvisible() ? "\<c-p>" : "\<s-tab>"

"TODO try to get <s-tab> to do <c-C>c for column complete

"VirtualEnv
"let g:virtualenv_directory = '/Users/ntomasino/miniconda/'
let g:virtualenv_auto_activate = 1

nnoremap <M-h> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <M-j> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <M-k> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <M-l> {Right-Mapping} :TmuxNavigateRight<cr>

"SUPERTAB
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = \"context"
"set completeopt=menuone,longest,preview

"let g:bufferline_echo = 0
"autocmd VimEnter * let &statusline='%p %{bufferline#refresh_status()}' .bufferline#get_status_string()
"
"=======================END PLUGIN CONFIG==========================================
"
" Actual Vim Config
" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %

set hidden

" home and end, page up and page down mappings 
 noremap H <home>
 vnoremap H <home>
 noremap L <end>
 vnoremap L <end>
 noremap <leader>k <pageup>
 "vnoremap K <pageup>
 noremap <leader>j <pagedown>
 "vnoremap J <pagedown>

 nnoremap Q :qall!<CR>

" Remap +/- to increment and decrement 32
 nnoremap + <C-a>
 nnoremap - <C-x>

"====[ I'm sick of typing :%s/.../.../g ]=======
"https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc
"[Shortcut for :s///g]  
 nmap S :%s/\v/g<LEFT><LEFT>
 vmap S :Blockwise s/\v/g<LEFT><LEFT>

"====[ Toggle visibility of naughty characters ]============
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
set lcs=tab:⇒·,trail:␣,nbsp:~"
highlight InvisibleSpaces ctermfg=Black ctermbg=Black
call matchadd('InvisibleSpaces', '\s\+\%#', 100)


"SUM NUMBERS IN A FILE (command is for visual selection)
let g:S = 0  "result in global variable S
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction

"function! RunSum()
    "execute ":let g:S=0" 
    "execute ":'<,'>s/\\d\\+/\\=Sum(submatch(0))/g"
    "execute ":echo g:S"
"endfunction
"copy selection into register a
"vnoremap S "ay :call RunSum()<CR>
"vnoremap S :let g:S=0 <CR> :'<,'>s/\d\+/\=Sum(submatch(0))/g <CR> :echo g:S <CR>

"sum up numbers ON multible lines in a visual selection
"works - just NOT with whitespace, turn off highlighting
vmap gs y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>i==<CR><ESC>V:!bc<CR>
"vmap gs y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>'[0"wy$:.s§.*§\=w§<CR>'[yyP:.s/./=/g<CR>_j
"vmap gs y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>'[0"wy$:.s§.*§\=w§<CR>'[yyP:.s/./=/g_j<CR>+1!bc<CR>kJ
"vmap gs y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>'[0"wy$:.s§.*§\=w§<CR>'[yyP:.s/./=/g_j<CR>
"vmap gs y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>'[0"wy$:.s§.*§\=w§<CR>i==<CR><ESC>V:!bc<CR>

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

"Tags 
" ctags -R src/  -- sets up a tags file which allows definition jumping
" with Ctrl-] and Ctrl-T to jump back. ( or g] )
"semicolon means it starts in the cur dir and searches up directories until it
"hits a tags file
set tags=tags
"set tags=tags;
"set tags=./tags
"set tags=./tags,../tags,tags;
set path+=**

function! UpdateTags()
  execute ":!ctags -R --languages=SQL,SH,Python --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "SQL tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()
"  execute \":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./\"

" Jump Between Tags (forwards and back respectively)
 nnoremap <C-u> <C-]> 
 nnoremap <C-i> :tn<CR>
 nnoremap <C-y> <C-t>

" Explore (Netrw) Options
"let netrw_preview = 2
"let g:netrw_liststyle = 3
"let g:netrw_winsize   = 20

" COPY & PASTE
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
" vnoremap <C-c> "*y need to compile with +clipboard for this
" set pastetoggle=<F2>
 "set clipboard=unnamed
 "set clipboard=*
 "set clipboard^=unnamed
 set clipboard+=unnamed
"if $TMUX == ''
    "set clipboard+=unnamed
"endif

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


" Mouse and backspace
set mouse=a  " ON OSX press ALT and click
"" set bs=2     " make backspace behave like normal again


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
 noremap <leader>n :nohl<CR>

 nnoremap s :update<CR>
 nnoremap w ge

"actually quit
 nnoremap q :quit<CR>
"soft close buffers
 "nnoremap Q :bdelete<CR> 
"close all buffers but this one
 nnoremap <leader>q <ESC>:w<CR>:%bd<CR>:e#<CR>

"Set up fast keycodes
"http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
"set timeout timeoutlen=1000 ttimeoutlen=100
"if !has("gui_running")
""  if &term == "screen-256color"
""    set <Home>=^[[H <End>=^[[F <BS>=^?
"    set <S-Up>=^[OA 
"    set <S-Down>=^[OB 
"    set <S-Right>=^[OC 
"    set <S-Left>=^[OD
""    set <xF1>=s{C-v}{C-S-Up}^[[1;6A <xF2>=^[[1;6B <xF3>=^[[1;6C <xF4>=^[[1;6D
"endif
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" shift+arrow selection
"nmap <S-Up> v<Up>
"nmap <S-Down> v<Down>
"nmap <S-Left> v<Left>
"nmap <S-Right> v<Right>
"vmap <S-Up> <Up>
"vmap <S-Down> <Down>
"vmap <S-Left> <Left>
"vmap <S-Right> <Right>
"imap <S-Up> <Esc>v<Up>
"imap <S-Down> <Esc>v<Down>
"imap <S-Left> <Esc>v<Left>
"imap <S-Right> <Esc>v<Right>

"---BUFFERS---
" Change between files more quickly when editing multiple files
" use :files to see all open files
 nnoremap <c-n> <esc>:bprevious<CR>
 nnoremap <c-b> <esc>:buffer #<CR>
 nnoremap <c-m> <esc>:bnext<CR>
 nnoremap B :buffers<CR>:buffer<SPACE>
 "nnoremap b :buffers<CR>:buffer<SPACE> "this pisses @momo off too much
 nnoremap O :only<CR>
 set scrolloff=10



" map sort function to a key
 vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), then SELECT several lines of code here and
" then press ``>`` several times.
 vnoremap < <gv
 vnoremap > >gv


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


"format gvim
 if has('gui_running')
"  set t_Co=256
  colorscheme pablo
"  set lines=60 columns=108 lineif has('gui_win32')
  if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h14:cANSI
  else
    set guifont=Monaco:h14
  endif
 endif

" Enable syntax highlighting
" You need to reload this file for the change to apply
 ""filetype off
 ""filetype plugin indent on
 ""syntax on


" Showing line numbers and length
" set number  " show line numbers
" set relativenumber  " show line numbers
 set nowrap  " don't automatically wrap ON load
 "set fo-=t   " don't automatically wrap text when typing
 set textwidth=120   " width of document (used by gd)
 set colorcolumn=80,120
 highlight ColorColumn ctermbg=Green "DarkGrey

 "hi CSVColumnEven ctermbg=4 guibg=Grey
 hi CSVColumnEven ctermbg=0 guibg=Grey
 "for dark terminals
 "hi CSVColumnOdd  ctermbg=0 guibg=DarkBlue
 hi CSVColumnOdd  ctermbg=0 guibg=Grey
 "for light terminals
 "hi CSVColumnOdd  term=bold ctermbg=Cyan guibg=Cyan

" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
"" set history=700
"" set undolevels=700


" Make search case insensitive
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
 set nobackup
 set nowritebackup
 set noswapfile

" =====================
" My Stuff
" ====================

"Load plugins FROM pathogen and vimballs in the .vim/ directory
""execute pathogen#infect()
filetype plugin on "might change to just 'filetype on'


"Route the semi-colon AS a colon to type commands faster
nnoremap ; :


" Real programmers don't use TABs but spaces
set ls=4
"set ts=4
set tabstop=4 " size of a hard tabstop
set softtabstop=4 " Sets the number of columns for a TAB
set shiftwidth=4 " for block comments
set expandtab " always uses spaces instead of tab characters
autocmd FileType make setlocal noexpandtab
set nocompatible
set backspace=2
set ignorecase


"Status line - show the percentage through a file 
set laststatus=2

"set statusline =%{args()}
"set statusline =%f\ %P

""set statusline +=%4*\ %<%F%*            "full path
"set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
" tpope's
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

"Examples
":call Exec('buffers')
"This will include the output of :buffers into the current buffer.
"
"function! Exec(command)
"    redir =>output
"    silent exec a:command
"    redir END
"    let @o = output
""    execute "put o"
""    return @o
"    set statusline=%f\ %{@o}
""    set statusline=%{<c-r>=substitute(@o, 'o', 'oo', 'g')<CR>}
""    set statusline=%f\ %{<c-r>=substitute(@o, 'i', 'ii', 'g')<CR>}
""    set statusline=%f\ %{:<c-r>os/i/ii/g}
"endfunction!



"Turn ON syntax highlighting
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

"Get home and end to work ON osx
""map  <Esc>[7~ <Home>
""map  <Esc>[8~ <End>
""imap <Esc>[7~ <Home>
""imap <Esc>[8~ <End>

"Cursor Changes depending ON mode
"http://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

" ============================================================================
" General IDE Setup
" ============================================================================

"not sure about these exactly
"autocmd BufNewFile,BufRead *.py set ft=python
"autocmd BufNewFile,BufRead *.json set ft=javascript
"autocmd BufNewFile,BufRead *.conf set ft=javascript
"autocmd BufNewFile,BufRead *.config set ft=javascript
"
au! BufRead,BufNewFile *.json setfiletype json
au! BufRead,BufNewFile *.js setfiletype javascript
au! BufRead,BufNewFile *.scala setfiletype scala
au! BufRead,BufNewFile *.py setfiletype python
au! BufRead,BufNewFile *.c setfiletype c
au! BufRead,BufNewFile *.r, *.R setfiletype r
au! BufRead,BufNewFile *.m, *.oct, *.octave setfiletype octave

"Folding
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

set completeopt+=longest

" ============================================================================
" Python IDE Setup
" ============================================================================
"
"Simple compile/run scripts
" autocmd FileType py map <C-F8> :update<CR> :!python %<CR>

"Execute the visually selected text
autocmd FileType py noremap <C-CR> :!python %<CR>
" vnoremap <C-CR> :'<,'>w !python


" --Nah-- Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"" set laststatus=2


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" defaults
"let g:jedi#force_py_version = 2.7
let g:jedi#completions_enabled = 1
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"not quite jedi completions, but guilty by association
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 1

map <Leader>b obreakpoint()  # TODO BREAKPOINT<C-c>
"map <Leader>b oimport ipdb; ipdb.set_trace()  # TODO BREAKPOINT<C-c>
"map <Leader>b oimport ptpdb; ptpdb.set_trace()  # TODO BREAKPOINT<C-c>
"map <Leader>b oimport pdb; pdb.set_trace()  # TODO BREAKPOINT<C-c>

"
"" prefs
"" use splits NOT buffers
" let g:jedi#popup_select_first = 0
"  map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

 "inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
 "inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"tab complete
"function! InsertTabWrapper(direction)
    "let col = col('.') - 1
    "if !col || getline('.')[col - 1] !~ '\k'
        "return "\<tab>"
    "elseif "backward" == a:direction
        "return "\<c-p>"
    "else
        "return "\<c-n>"
    "endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"=======================
" Clang -- C and C++ IDE
" git clone https://github.com/Rip-Rip/clang_complete.git
" requires sudo apt-get install libclang-dev
" (and possibly libclang1 AS well)
" '::', '->', '.'   open completion lists
" K     takes you to docs
" Ctrl+]    take you to function def
" Ctrl+t    takes you back
"=======================
"
"let g:clang_use_library = 1 
"let g:clang_library_path = "/usr/lib/"
"let g:clang_complete_patterns = 1
"let g:clang_auto_SELECT = 1
"let g:clang_complete_copen = 1
""let g:clang_periodic_quickfix = 1
"let g:clang_snippets = 1
"let g:clang_user_options='-std=gcc' 
"autocmd FileType c map <F2>  :call g:ClangUpdateQuickFix()<CR>

"Simple compile/run scripts
autocmd FileType c map <F4> :update<CR> :!gcc % -o %.out -lm <CR>
autocmd FileType c map <F3> :!./%.out<CR>

"Debugging with gdb
"break <linenumber>     sets a breakpoint ON that line
"run    runs the program
"step   steps through the code
"continue   continues to next breakpoint
"map <F6> :update<CR> :!gcc % -g -o %.out -lm <CR> :!gdb %.out<CR>

"Debugging with cgdb
"git clone git://github.com/cgdb/cgdb.git
"autocmd FileType c map <F5> :update<CR> :!gcc % -g -o %.out -lm <CR> :!cgdb %.out<CR>

"Quick code commenting
"autocmd FileType c nnoremap c i/**/<left><left>

" ============================================================================
" Java IDE Setup
" ============
" http://vim.sourceforge.net/scripts/script.php?script_id=1785
"
" Clone below into ~/.vim/bundle for pathogen to auto-install
" https://github.com/vim-scripts/javacomplete
" Ctrl-X Ctrl-O opens up autocomplete by default
" ============================================================================
"autocmd Filetype java,groovy,scala setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java,groovy,scala setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java,groovy,scala setlocal completefunc=javacomplete#CompleteParamsInfo
"autocmd Filetype java,groovy,scala inoremap . .<C-x><C-O>
"
"
" Commenting
"autocmd FileType java,groovy,scala nnoremap c i//<ESC>
"
" Commenting blocks of code.
"autocmd FileType vimrc,zshrc,bashrc   let b:comment_leader = '#'
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
" TODO add a space after the comment_leader
noremap <silent> <leader>c :<C-B>silent <C-E>s/\v([^ \t])/<C-R>=escape(b:comment_leader,'\/')<CR>\1/<CR>:nohlsearch<CR>
noremap <silent> <leader>C :<C-B>silent <C-E>s/\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Title sections
noremap <silent> <leader>t :s/$/ # TODO /e<CR>:nohlsearch<CR>
