-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.filetype = "on"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Folds
-- These settings are often set automatically by nvim-orgmode via Tree-sitter
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- opt.foldmethod = "indent"
opt.foldlevel = 1
opt.foldlevelstart = 1
opt.foldtext = "foldtext()"
-- opt.foldignore = "#"
--
vim.g.autoformat = false


-- opt.filetype.plugin = "on"
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "python",
--     callback = function()
--         vim.cmd("packadd molten-nvim")
--     end,
-- })
