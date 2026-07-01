-- vim.g.molten_* globals are set in init.lua before packadd
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = true, desc = desc })
        end
        map("n", "<CR>",             ":MoltenEvaluateLine<CR>",             "Run line")
        map("v", "<CR>",             ":<C-u>MoltenEvaluateVisual<CR>gv",    "Run selection")
        map("n", "<localleader>mi",  ":MoltenInit<CR>",                     "Initialize the plugin")
        map("n", "<localleader>e",   ":MoltenEvaluateOperator<CR>",         "Run operator selection")
        map("n", "<localleader>rl",  ":MoltenEvaluateLine<CR>",             "Evaluate line")
        map("n", "<localleader>rr",  ":MoltenReevaluateCell<CR>",           "Re-evaluate cell")
        map("v", "<localleader>r",   ":<C-u>MoltenEvaluateVisual<CR>gv",    "Evaluate visual selection")
        map("n", "<localleader>rd",  ":MoltenDelete<CR>",                   "Molten delete cell")
        map("n", "<localleader>oh",  ":MoltenHideOutput<CR>",               "Hide output")
        map("n", "<localleader>os",  ":noautocmd MoltenEnterOutput<CR>",    "Show/enter output")
    end,
})
