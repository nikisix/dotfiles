return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = { enabled = false }, -- Turns off pycodestyle
                                mccabe = { enabled = false }, -- Optional: turn off others
                                pyflakes = { enabled = false },
                                flake8 = { enabled = false },
                            },
                        },
                    },
                },
            },
        },
    },
}

-- return {
--     "neovim/nvim-lspconfig",
-- }

-- This is how you would remap TAB across ALL files
-- return {
--     {
--         "neovim/nvim-lspconfig",
--         init = function()
--             local keys = require("lazyvim.plugins.lsp.keymaps").get()
--             -- disable a keymap
--             keys[#keys + 1] = { "K", false }
--             -- add a keymap
--             keys[#keys + 1] = { "<TAB>", vim.lsp.buf.hover, desc = "Hover" }
--         end,
--     },
-- }
--

-- Backup config
--    opts = function()
--        local keys = require("lazyvim.plugins.lsp.keymaps").get()
--        -- Remap 'K' to <up-to-next-blank-line> for all filetypes
--        keys[#keys + 1] = { "K", false }
--        vim.keymap.set({ "n", "v" }, "K", "{")
--        -- Map TAB to <Documenation Reference> for python and lua files only
--        -- Literal TAB required for org files
--        vim.api.nvim_create_autocmd("LspAttach", {
--            group = vim.api.nvim_create_augroup("py_keys", {}),
--            desc = "Python keys",
--            callback = function(ev)
--                if vim.bo[ev.buf].filetype == "python" or vim.bo[ev.buf].filetype == "lua" then
--                    -- vim.list_extend(keys, { { "K", false } })
--                    vim.list_extend(keys, {
--                        {
--                            "<TAB>",
--                            vim.lsp.buf.hover,
--                            desc = "Hover",
--                            mode = { "n", "v" },
--                        },
--                    })
--                    -- else
--                end
--            end,
--        })
--    end,

--{                                                                      │
--  "neovim/nvim-lspconfig",                                             │
--  opts = {                                                             │
--    servers = {                                                        │
--      ['*'] = {                                                        │
--        keys = {                                                       │
--          { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", has = "defi…│
--        },                                                             │
--      },                                                               │
--    },                                                                 │
--  },                                                                   │
--}                                                                      │
