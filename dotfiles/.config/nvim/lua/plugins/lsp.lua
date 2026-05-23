return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle =   { enabled = false }, -- Turns off pycodestyle
                                mccabe =        { enabled = false }, -- Optional: turn off others
                                pyflakes =      { enabled = false },
                                flake8 =        { enabled = false },
                            },
                        },
                    },
                },
            },
        },
    },
}
