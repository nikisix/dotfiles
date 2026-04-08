return { --orgmode
    "nvim-orgmode/orgmode",
    filetype = { "org" },
    config = function()
        require("orgmode").setup({
            org_agenda_files = { "~/org/*", "~/Dropbox/org/*", "~/notes/org/**/*" },
            org_default_notes_file = "~/notes/org/apporchid/todo.org",
            vim.keymap.set("n", ">>", ":org_demote_subtree<CR>", { desc = "org_demote_subtree" }),
        })
    end,
}
