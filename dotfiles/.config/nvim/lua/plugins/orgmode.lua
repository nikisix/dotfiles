require("orgmode").setup({
    org_agenda_files = { "~/org/**/*", "~/Dropbox/org/*", "~/notes/org/**/*" },
    org_default_notes_file = "~/notes/org/todo.org",
    mappings = {
        org_return_uses_meta_return = true,
        org_toggle_checkbox = "C-x",
    },
})
