require("cyberdream").setup({ transparent = true })
vim.cmd.colorscheme("cyberdream")
vim.api.nvim_set_hl(0, "Folded", { fg = "#5ea1ff", bg = "#1e2030" }) -- fold colors

-- Snacks explorer/picker: default links to NonText (dark grey) were unreadable on a
-- transparent dark background. Folders stay blue, hidden (dot) entries are amber,
-- ignored (gitignored, e.g. venv) entries are violet.
vim.api.nvim_set_hl(0, "SnacksPickerDirectory",   { fg = "#7cb7ff", bold = true }) -- folders
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden",  { fg = "#ffc66d" })              -- dotfiles/dotfolders
vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = "#c3a6ff" })              -- gitignored

-- Untracked entries (git status "?") also link to NonText and take priority over
-- the hidden color, so untracked dotfiles/folders stayed grey.
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#7ee0c3" }) -- untracked (mint)
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored",   { fg = "#c3a6ff" }) -- same violet as PathIgnored

-- orgmode headline levels (explicit, non-default so they survive orgmode's
-- own ColorScheme-triggered default-link refresh, same as Folded above)
vim.api.nvim_set_hl(0, "@org.headline.level1", { fg = "#ffffff", bold = true }) -- *
vim.api.nvim_set_hl(0, "@org.headline.level2", { fg = "#5080f0", bold = true }) -- **
vim.api.nvim_set_hl(0, "@org.headline.level3", { fg = "#90b0f0", bold = true }) -- ***
vim.api.nvim_set_hl(0, "@org.headline.level4", { fg = "#b0c8f0", bold = true }) -- ****
vim.api.nvim_set_hl(0, "@org.headline.level5", { fg = "#d0d0f0", bold = true }) -- *****

vim.api.nvim_set_hl(0, "@org.keyword.done"   , { fg = "#A3D0F0", bold = true }) -- *****

-- cyberdream transparent=true sets NormalFloat.bg=NONE; restore a solid background
-- so floating windows don't bleed through to the terminal background.
-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#16181a" })

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function()
--         vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#16181a" })
--     end,
-- })
