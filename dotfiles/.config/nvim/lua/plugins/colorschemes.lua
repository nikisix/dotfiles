require("cyberdream").setup({ transparent = true })
vim.cmd.colorscheme("cyberdream")
vim.api.nvim_set_hl(0, "Folded", { fg = "#5ea1ff", bg = "#1e2030" })

-- cyberdream transparent=true sets NormalFloat.bg=NONE; restore a solid background
-- so floating windows don't bleed through to the terminal background.
-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#16181a" })

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function()
--         vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#16181a" })
--     end,
-- })
