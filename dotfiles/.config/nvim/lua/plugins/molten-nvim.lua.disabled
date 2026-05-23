return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        -- fix this filtype to only load when python is the filetype
        filetype = { "python" },
        ft = { "python" },
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 35
            -- vim.g.molten_wrap_output = true
            vim.g.python3_host_prog = vim.fn.expand("~/envs/neovim/bin/python3")

            -- Minimum Suggested

            vim.keymap.set("n", "<CR>", ":MoltenEvaluateLine<CR>", { desc = "Run line" })
            vim.keymap.set("v", "<CR>", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Run line" })
            vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
            vim.keymap.set(
                "n",
                "<localleader>e",
                ":MoltenEvaluateOperator<CR>",
                { silent = true, desc = "run operator selection" }
            )
            vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
            vim.keymap.set(
                "n",
                "<localleader>rr",
                ":MoltenReevaluateCell<CR>",
                { silent = true, desc = "re-evaluate cell" }
            )
            vim.keymap.set(
                "v",
                "<localleader>r",
                ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "evaluate visual selection" }
            )

            -- Other example mappings

            vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
            vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
            vim.keymap.set(
                "n",
                "<localleader>os",
                ":noautocmd MoltenEnterOutput<CR>",
                { silent = true, desc = "show/enter output" }
            )
        end,
    },
}
