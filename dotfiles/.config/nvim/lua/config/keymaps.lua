-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- use `` instead
local map = vim.keymap.set
local umap = vim.keymap.del


-- [[Six Vim]]

-- Saving
map("n", "s", ":w<CR>")
map("n", "q", ":q<CR>")

-- Motion
map("n", "<Tab>", vim.lsp.buf.hover, { noremap = true })
map({ "n", "v" }, "H", "^", {noremap = true})
map({ "n", "v" }, "L", "$", {noremap = true})
map({ "n", "v" }, "J", "}", {noremap = true})
map({ "n", "v" }, "K", "{", {noremap = true})

-- Buffers
map("n", "B", ":buffers<cr>:buffer<space>")

-- map("n", "<CR>", ":bn<cr>")
map("n", "`", ":bn<cr>")

-- Marks
map("n", "M", ":marks<cr>")

-- Splits
map("n", "t", "<c-w>w")

-- Tags
map("n", "T", ":TagbarToggle<CR>")

-- Folds
map("n", "f", "zm")
map("n", "F", "zr")

-- lvim.colorscheme = "system76"

-- TODO indent based folding
-- vim.cmd([[
--   "Folding
--   "zM fold all
--   "zR unfold all
--   set nofoldenable
--   set foldmethod=indent
--   " nnoremap f zm
--   " nnoremap F zr
--   " set foldmethod=expr
--   " set foldexpr=FoldMethod(v:lnum)
--   "
--   " function! FoldMethod(lnum)
--   "   "get string of current line
--   "   let crLine=getline(a:lnum)
--   "
--   "   " check if empty line
--   "   if empty(crLine) "Empty line or end comment
--   "     return -1 " so same indent level as line before
--   "   endif
--   "
--   "   " check if comment
--   "   let a:data=join( map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")') )
--   "   if a:data =~ ".*omment.*"
--   "     return '='
--   "   endif
--   "
--   "   "Otherwise return foldlevel equal to indent /shiftwidth (like if
--   "   "foldmethod=indent)
--   "   else  "return indent base fold
--   "     return indent(a:lnum)/&shiftwidth
--   " endfunction
--   "
--   " set completeopt+=longest
--
--   " nnoremap <leader>os :call jukit#splits#output()<cr>
--   " nnoremap <leader>os :JukitOut source ./env/bin/activate<cr>
-- ]])
