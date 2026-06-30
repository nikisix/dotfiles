-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text when yanking (copying)",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", -- The highlight color group to use
      timeout = 150,         -- How long the highlight lasts in milliseconds
    })
  end,
})

-- 2. Clean Code Block Boundaries (For Org/Markdown)When writing in .org or .md files, you often want distinct visual settings like wrapping text and spelling checks, but you don't want relative line numbers cluttering your view. This autocommand toggles your line numbers automatically when you enter or leave those specific files.
vim.api.nvim_create_autocmd("FileType", {
  desc = "Clean up boundaries for prose and code notes. +spell",
  pattern = { "org", "markdown" },
  callback = function()
    vim.opt_local.wrap = true          -- Wrap long lines of text
    vim.opt_local.number = false       -- Hide absolute line numbers
    vim.opt_local.relativenumber = false -- Hide relative line numbers
    vim.opt_local.signcolumn = "no"    -- Hide the left gutter column for a cleaner look
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "map Tab to toggle folds in json files",
  pattern = { "json" },
  callback = function()
    vim.keymap.set("n", "<Tab>", "za", { buffer = true, desc = "Toggle fold" })
  end,
})

-- Automatically resize-splits upon terminal resize and focusing a window
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Automatically resize splits when terminal window is resized",
  group = vim.api.nvim_create_augroup("resize-splits", { clear = true }),
  callback = function()
    vim.cmd("wincmd =")
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  desc = "Automatically expand the focused split window",
  group = vim.api.nvim_create_augroup("auto-expand-splits", { clear = true }),
  callback = function()
    -- Set the width and height of the active window
    -- You can adjust these numbers to your liking
    vim.opt_local.winwidth = 100
    vim.opt_local.winheight = 30
  end,
})
