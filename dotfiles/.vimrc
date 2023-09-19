"####################"
"##    SIX VIM     ##"
"####################"
"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"[[ SETTINGS ]]
let mapleader = "\<Space>"
set path+=** " Recursive search for files with vims native 'gf' (goto file)
set hlsearch " Make search case insensitive
set incsearch
set ignorecase
set smartcase
set nobackup " Disable stupid backup and swap files - they trigger too many events for file system watchers
set nowritebackup
set noswapfile
set laststatus=2 "Status line - show the percentage through a file
set expandtab
set tabstop=4
set shiftwidth=4

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
noremap <leader>k <pageup>
noremap <leader>j <pagedown>

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
setlocal spell spelllang=en_us "uncomment this to allow spell-checking

noremap <leader>n :nohl<CR>

" [[ PYTHON IDE ]]
" autocmd FileType py noremap <buffer> <C-CR> :!python %<CR>
" noremap <C-CR> :!python %<CR>
noremap <F12> :!python %<CR>
" map <Leader>b obreakpoint()  # TODO BREAKPOINT<C-c>
map <Leader>b oimport ipdb; ipdb.set_trace()  # TODO BREAKPOINT<C-c>

" COMMENTING blocks of code.
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

" Quick-Todo
noremap <silent> <leader>t :s/$/  # TODO /e<CR>:nohlsearch<CR>A
