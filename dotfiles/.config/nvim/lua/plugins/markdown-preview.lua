return {
    -- install without yarn or npm
    -- markdown-preview.nvim
    -- A markdown preview plugin for Neovim that uses the built-in webview.
    -- This plugin allows you to preview markdown files in a webview within Neovim.
    -- It supports live preview, custom CSS, and more.
    -- Note: This plugin requires Neovim 0.5 or higher.
    -- install without yarn or npm
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,

    -- install with yarn or npm
    -- "iamcco/markdown-preview.nvim",
    -- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- build = "cd app && yarn add",
    -- init = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    -- end,
    -- ft = { "markdown" },
}
