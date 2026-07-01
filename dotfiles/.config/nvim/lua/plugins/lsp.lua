-- nvim-lspconfig auto-registers server configs on packadd; no require("lspconfig") needed
require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.config("pylsp", {
    settings = { pylsp = { plugins = {
        pycodestyle = { enabled = false },
        mccabe      = { enabled = false },
        pyflakes    = { enabled = false },
        flake8      = { enabled = false },
    }}},
})
vim.lsp.enable("pylsp")
