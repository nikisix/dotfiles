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

-- Display diagnostics inline (virtual text) plus signs, underline, and hover floats
vim.diagnostic.config({
    virtual_text = { source = "if_many", spacing = 2 },
    signs        = true,
    underline    = true,
    update_in_insert = false,
    severity_sort    = true,
    float = { border = "rounded", source = true },
})
