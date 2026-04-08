-- Updates (1)
--   ○ image.nvim  molten-nvim      ■ build warning
--       `lua` version `5.1` needed, but found `Lua 5.4.7  Copyright (C) 1994-2024 Lua.org, PUC-Rio`
--       `lua5.1` or `lua` or `lua-5.1` version `5.1` not installed
-- 
--       This plugin requires `luarocks`. Try one of the following:
--        - fix your `luarocks` installation
--        - enable `hererocks` with `opts.rocks.hererocks = true`
--        - disable `luarocks` support completely with `opts.rocks.enabled = false`
-- 
--       Will try building anyway, but will likely fail...
return {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    commit = "21909e3eb03bc738cce497f45602bf157b396672",
    rocks = { hererocks = true },
    config = function()
        require("image").setup({
            backend = "kitty",
            processor = "magick_cli",
            kitty_method = "icat",
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    only_render_image_at_cursor_mode = "popup",
                    floating_windows = false,
                    filetypes = { "markdown", "vimwiki" },
                },
                neorg = {
                    enabled = true,
                    filetypes = { "norg" },
                },
                typst = {
                    enabled = true,
                    filetypes = { "typst" },
                },
                html = {
                    enabled = false,
                },
                css = {
                    enabled = false,
                },
            },
            window_overlap_clear_enabled = false,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
            editor_only_render_when_focused = false,
            tmux_show_only_in_active_window = false,
            hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
        })
    end,
}

-- config = function()
--     require("image").setup({
--         backend = "kitty",
--         processor = "magick_cli", -- or "magick_rock"
--         integrations = {
--             markdown = {
--                 enabled = true,
--                 clear_in_insert_mode = false,
--                 download_remote_images = true,
--                 only_render_image_at_cursor = false,
--                 only_render_image_at_cursor_mode = "popup",
--                 floating_windows = false, -- if true, images will be rendered in floating markdown windows
--                 filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--             },
--             neorg = {
--                 enabled = true,
--                 filetypes = { "norg" },
--             },
--             typst = {
--                 enabled = true,
--                 filetypes = { "typst" },
--             },
--             html = {
--                 enabled = false,
--             },
--             css = {
--                 enabled = false,
--             },
--         },
--         max_width = nil,
--         max_height = nil,
--         max_width_window_percentage = nil,
--         max_height_window_percentage = 50,
--         window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
--         window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
--         editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
--         tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
--         hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
--     })
-- end,
