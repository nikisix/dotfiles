require("orgmode").setup({
    org_agenda_files = { "~/org/**/*", "~/Dropbox/org/*", "~/notes/org/**/*" },
    org_default_notes_file = "~/notes/org/todo.org",
    -- cit / ciT cycle forward / backward through these. Deliberately no "TODO(t)"
    -- fast-access letters: adding them makes cit open a key-picker instead of cycling.
    org_todo_keywords = { "TODO", "INPROGRESS", "BLOCKED", "|", "DONE" },
    -- Keywords without a face here fall back to @org.keyword.todo / @org.keyword.done.
    -- Registering one also adds the @org.keyword.face.<KEYWORD> treesitter capture,
    -- so this is what makes INPROGRESS colorable at all — not just a color override.
    org_todo_keyword_faces = {
        INPROGRESS = ":foreground #A060F0 :weight bold",
        BLOCKED = ":foreground #A07010 :weight bold",
    },
    mappings = {
        org_return_uses_meta_return = true,
        org_toggle_checkbox = "C-x",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc"
        vim.treesitter.start()
    end,
})
