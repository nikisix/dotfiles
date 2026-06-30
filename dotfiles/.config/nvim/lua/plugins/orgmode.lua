return {
    "nvim-orgmode/orgmode",
    filetype = { "org" },
    config = function()
        require("orgmode").setup({
            org_agenda_files = { "~/org/**/*", "~/Dropbox/org/*", "~/notes/org/**/*" },
            org_default_notes_file = "~/notes/org/todo.org",
            -- vim.keymap.set({"n", "v"}, ">>", ":org_do_demote<CR>", { desc = "org demote" }),
            mappings = {
                org_return_uses_meta_return = true,
                org_toggle_checkbox = 'C-x'
                -- org_do_demote = ">>",
            }
        })
    end,
}
