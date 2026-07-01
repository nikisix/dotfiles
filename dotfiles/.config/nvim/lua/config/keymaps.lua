-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
-- local umap = vim.keymap.del


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
-- map("n", "<TAB>", "za")
