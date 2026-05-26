return { --orgmode
    "nvim-orgmode/orgmode",
    filetype = { "org" },
    config = function()
        require("orgmode").setup({
            org_agenda_files = { "~/org/", "~/Dropbox/org/*", "~/notes/org/**/*" },
            org_default_notes_file = "~/notes/org/todo.org",
            -- vim.keymap.set({"n", "v"}, ">>", ":org_do_demote<CR>", { desc = "org demote" }),
            mappings = {
                org_return_uses_meta_return = true,
                -- org_do_demote = ">>",
            }
        })
        -- meta return for checkboxes and todos
        -- vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
        --   silent = true,
        --   buffer = true,
        -- })
    end,
}
