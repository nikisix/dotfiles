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

" Quick-Todo
noremap <silent> <leader>t :s/$/  # TODO /e<CR>:nohlsearch<CR>A
