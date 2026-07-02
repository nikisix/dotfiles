require("noice").setup({
    -- Let :! and other command output use Neovim's native (Vim-like) pager
    -- instead of noice's transient overlay. Cmdline popup + popupmenu below
    -- are still handled by noice.
    messages = { enabled = false },
    views = {
        cmdline_popup = {
            position = { row = "95%", col = "50%" },
            size = { width = 60, height = "auto" },
        },
        popupmenu = {
            relative = "editor",
            position = { row = "91%", col = "50%" },
            size = { width = 60, height = 10 },
            border = { style = "rounded", padding = { 0, 1 } },
            win_options = { winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" } },
        },
    },
})
