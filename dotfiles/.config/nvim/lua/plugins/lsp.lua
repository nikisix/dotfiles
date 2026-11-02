-- nvim-lspconfig auto-registers server configs on packadd; no require("lspconfig") needed
require("mason").setup()
require("mason-lspconfig").setup()

-- pyright: type checking, warnings, and errors
vim.lsp.config("pyright", {
    settings = { python = { analysis = {
        typeCheckingMode = "basic",
        diagnosticMode   = "openFilesOnly",
    }}},
})
vim.lsp.enable("pyright")

-- pylsp (auto-enabled by mason-lspconfig): silence pycodestyle E501 "line too long".
-- Setting `ignore` replaces pycodestyle's default ignore list, so restate it alongside E501.
vim.lsp.config("pylsp", {
    settings = { pylsp = { plugins = { pycodestyle = {
        ignore = { "E121", "E123", "E126", "E221", "E226", "E24", "E704", "W503", "W504", "E501" },
    }}}},
})

-- Display diagnostics inline (virtual text) plus signs, underline, and hover floats
vim.diagnostic.config({
    virtual_text = { source = "if_many", spacing = 2 },
    signs        = true,
    underline    = true,
    update_in_insert = false,
    severity_sort    = true,
    float = { border = "rounded", source = true },
})
