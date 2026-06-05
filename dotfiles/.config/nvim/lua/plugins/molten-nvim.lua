return {
    {
        "benlubas/molten-nvim",
        -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        ft = { "python" },
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_auto_open_output = true
            vim.g.python3_host_prog = vim.fn.expand("/Users/six/code/dataframe/venv/bin/python")
        end,
        config = function()
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = true, desc = desc })
            end

            map("n", "<CR>", ":MoltenEvaluateLine<CR>", "Run line")
            map("v", "<CR>", ":<C-u>MoltenEvaluateVisual<CR>gv", "Run selection")
            map("n", "<localleader>mi", ":MoltenInit<CR>", "Initialize the plugin")
            map("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", "Run operator selection")
            map("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", "Evaluate line")
            map("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", "Re-evaluate cell")
            map("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", "Evaluate visual selection")
            map("n", "<localleader>rd", ":MoltenDelete<CR>", "Molten delete cell")
            map("n", "<localleader>oh", ":MoltenHideOutput<CR>", "Hide output")
            map("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", "Show/enter output")
        end,
    },
}
