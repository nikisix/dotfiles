require("snacks").setup({
    picker = {
        hidden = true,
        ignored = true,
        on_show = function(picker)
            -- layout:update() calls nvim_win_set_config on each floating window,
            -- which rebuilds the window grid — the same path VimResized takes.
            -- redraw! alone cannot rebuild an undrawn grid; only nvim_win_set_config can.
            vim.schedule(function()
                picker.layout:update()
            end)
        end,
    },
})
