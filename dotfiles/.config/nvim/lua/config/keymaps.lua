-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- use `` instead
local map = vim.keymap.set

-- [[Six Vim]]

-- Saving
map("n", "s", ":w<CR>")
map("n", "q", ":q<CR>")

-- Motion
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "J", "}")
map({ "n", "v" }, "K", "{")

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

-- lvim.colorscheme = "system76"

-- TODO indent based folding
vim.cmd([[
  "Folding
  "zM fold all
  "zR unfold all
  set foldmethod=indent
  " set nofoldenable
  nnoremap f zm
  nnoremap F zr
  " set foldmethod=expr
  " set foldexpr=FoldMethod(v:lnum)
  "
  " function! FoldMethod(lnum)
  "   "get string of current line
  "   let crLine=getline(a:lnum)
  "
  "   " check if empty line
  "   if empty(crLine) "Empty line or end comment
  "     return -1 " so same indent level as line before
  "   endif
  "
  "   " check if comment
  "   let a:data=join( map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")') )
  "   if a:data =~ ".*omment.*"
  "     return '='
  "   endif
  "
  "   "Otherwise return foldlevel equal to indent /shiftwidth (like if
  "   "foldmethod=indent)
  "   else  "return indent base fold
  "     return indent(a:lnum)/&shiftwidth
  " endfunction
  "
  " set completeopt+=longest

  " nnoremap <leader>os :call jukit#splits#output()<cr>
  " nnoremap <leader>os :JukitOut source ./env/bin/activate<cr>
]])
