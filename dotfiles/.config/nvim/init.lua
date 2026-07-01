-- Leader keys must be set before any plugin loads
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

-- Globals that must be set before their plugin loads
vim.g.mkdp_filetypes = { "markdown" }
vim.g.molten_image_provider = "image.nvim"
vim.g.molten_auto_open_output = true
vim.g.python3_host_prog = vim.fn.expand("/Users/six/code/dataframe/venv/bin/python")

-- Re-download blink.cmp native library after install or update
vim.api.nvim_create_autocmd("User", {
    pattern = "PackChanged",
    callback = function(ev)
        if ev.data.spec.name == "blink.cmp" and ev.data.kind ~= "remove" then
            require("blink.cmp").download()
        end
    end,
})

-- Install plugins (no-op for already-installed; downloads missing on first run)
vim.pack.add({
    -- Colorschemes
    -- Large collection of extra themes
    "https://github.com/lunarvim/colorschemes",
    -- Active colorscheme; transparent mode + Folded highlight
    "https://github.com/scottmckendry/cyberdream.nvim",
    -- UI
    -- Buffer tabs rendered at the top of the screen
    "https://github.com/akinsho/bufferline.nvim",
    -- Status line at the bottom
    "https://github.com/nvim-lualine/lualine.nvim",
    -- Floating cmdline popup; custom position configured
    "https://github.com/folke/noice.nvim",
    -- File/grep/buffer picker; hidden/ignored files shown
    "https://github.com/folke/snacks.nvim",
    -- Shows available keybindings after a pause
    "https://github.com/folke/which-key.nvim",
    -- UI component lib — required by noice
    "https://github.com/MunifTanjim/nui.nvim",
    -- Icons for snacks, bufferline, lualine
    "https://github.com/echasnovski/mini.icons",
    -- Legacy icons for Tagbar and older vimscript plugins
    "https://github.com/ryanoasis/vim-devicons",
    -- Completion
    -- Native library required by blink.cmp v2
    "https://github.com/Saghen/blink.lib",
    -- Completion engine — LSP suggestions, buffer words, file paths, snippets
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
    -- LSP
    -- Configures LSP clients; custom pylsp setup
    "https://github.com/neovim/nvim-lspconfig",
    -- GUI installer for LSP servers — :Mason to browse and install
    "https://github.com/williamboman/mason.nvim",
    -- Bridges mason with lspconfig so installed servers auto-configure
    "https://github.com/williamboman/mason-lspconfig.nvim",
    -- Lua LSP enhancements for editing Neovim config
    "https://github.com/folke/lazydev.nvim",
    -- Rename symbol with live preview as you type
    "https://github.com/smjonas/inc-rename.nvim",
    -- Treesitter
    -- Syntax highlighting, folding, indentation
    "https://github.com/nvim-treesitter/nvim-treesitter",
    -- Select/move by function, class, parameter via treesitter
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    -- Treesitter-aware gc commenting — correct comment style per language
    "https://github.com/folke/ts-comments.nvim",
    -- Editing
    -- Tpope's surround (ys, cs, ds)
    "https://github.com/tpope/vim-surround",
    -- Enhanced C-a/C-x — cycles booleans, dates, not just numbers
    "https://github.com/monaqa/dial.nvim",
    -- Jump anywhere on screen with s/S
    "https://github.com/folke/flash.nvim",
    -- Find-and-replace UI across multiple files
    "https://github.com/MagicDuck/grug-far.nvim",
    -- Git
    -- Full git workflow: :Git, :Gdiff, :Gblame
    "https://github.com/tpope/vim-fugitive",
    -- Inline git hunk signs; hunk staging, navigation, blame
    "https://github.com/lewis6991/gitsigns.nvim",
    -- Navigation
    -- Fuzzy finder UI backed by the fzf binary
    "https://github.com/ibhagwan/fzf-lua",
    -- Sidebar panel for diagnostics, LSP references, quickfix
    "https://github.com/folke/trouble.nvim",
    -- Code outline sidebar, toggled with T keymap
    "https://github.com/preservim/tagbar",
    -- C-h/j/k/l navigate between nvim splits and tmux panes
    "https://github.com/christoomey/vim-tmux-navigator",
    -- Diagnostics
    -- Highlights TODO, FIXME, HACK, NOTE in source code
    "https://github.com/folke/todo-comments.nvim",
    -- Highlights arbitrary patterns e.g. hex color codes
    "https://github.com/echasnovski/mini.hipatterns",
    -- DAP
    -- Debug Adapter Protocol client
    "https://github.com/mfussenegger/nvim-dap",
    -- GUI panels for variables, call stack, breakpoints
    "https://github.com/rcarriga/nvim-dap-ui",
    -- Shows variable values inline while debugging
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    -- Python debug adapter (uses debugpy)
    "https://github.com/mfussenegger/nvim-dap-python",
    -- Installs DAP adapters via Mason
    "https://github.com/jay-babu/mason-nvim-dap.nvim",
    -- Lua DAP adapter for debugging Neovim plugins
    "https://github.com/jbyuki/one-small-step-for-vimkind",
    -- Async library required by nvim-dap-ui
    "https://github.com/nvim-neotest/nvim-nio",
    -- Language
    -- Org-mode: agenda, todos, capture
    "https://github.com/nvim-orgmode/orgmode",
    -- Run Jupyter code cells inline; tied to venv Python
    "https://github.com/benlubas/molten-nvim",
    -- Render images in kitty terminal; used by molten for plot output
    "https://github.com/3rd/image.nvim",
    -- Live browser preview of Markdown
    "https://github.com/iamcco/markdown-preview.nvim",
    -- Draw and align ASCII tables
    "https://github.com/dhruvasagar/vim-table-mode",
    -- Prolog syntax highlighting
    "https://github.com/adimit/prolog.vim",
    -- OpenSCAD language server
    "https://github.com/Leathong/openscad-LSP",
    -- Navigate stack traces — open file at line from error output
    "https://github.com/mattboehm/vim-unstack",
    -- Misc
    -- Saves and restores session per directory
    "https://github.com/folke/persistence.nvim",
    -- Switch Python virtualenvs interactively
    "https://github.com/linux-cultist/venv-selector.nvim",
    -- Lua utility library required by fugitive, orgmode, and others
    "https://github.com/nvim-lua/plenary.nvim",
    -- Claude AI integration
    "https://github.com/coder/claudecode.nvim",
})

-- Load plugins in dependency order
local p = vim.cmd.packadd
-- Shared dependencies first
p("plenary.nvim")
p("nui.nvim")
p("nvim-nio")
p("mini.icons")
p("vim-devicons")
-- Treesitter (textobjects depends on core)
p("nvim-treesitter")
p("nvim-treesitter-textobjects")
p("ts-comments.nvim")
-- Colorscheme (load before any UI that reads colors)
p("colorschemes")
p("cyberdream.nvim")
-- UI chrome
p("bufferline.nvim")
p("lualine.nvim")
p("noice.nvim")
p("snacks.nvim")
p("which-key.nvim")
-- Completion (lib must load before cmp)
p("blink.lib")
p("blink.cmp")
-- LSP (mason before lspconfig)
p("mason.nvim")
p("mason-lspconfig.nvim")
p("nvim-lspconfig")
p("lazydev.nvim")
p("inc-rename.nvim")
-- Editing
p("vim-surround")
p("dial.nvim")
p("flash.nvim")
p("grug-far.nvim")
-- Git
p("vim-fugitive")
p("gitsigns.nvim")
-- Navigation & search
p("fzf-lua")
p("trouble.nvim")
p("tagbar")
p("vim-tmux-navigator")
-- Diagnostics
p("todo-comments.nvim")
p("mini.hipatterns")
-- DAP
p("nvim-dap")
p("nvim-dap-ui")
p("nvim-dap-virtual-text")
p("nvim-dap-python")
p("mason-nvim-dap.nvim")
p("one-small-step-for-vimkind")
-- Language (image before molten)
p("image.nvim")
p("molten-nvim")
p("orgmode")
p("markdown-preview.nvim")
p("vim-table-mode")
p("prolog.vim")
p("openscad-LSP")
p("vim-unstack")
-- Misc
p("persistence.nvim")
p("venv-selector.nvim")
p("claudecode.nvim")

-- Core config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Plugin setup (order matches packadd order above)
require("plugins.colorschemes")
require("plugins.ui")
require("plugins.which-key")
require("plugins.completion")
require("plugins.lsp")
require("plugins.nvim-treesitter")
require("plugins.git")
require("plugins.navigation")
require("plugins.dap")
require("plugins.orgmode")
require("plugins.molten-nvim")
require("plugins.image_nvim")
require("plugins.snacks")
require("plugins.noice")
require("plugins.claudecode")
require("plugins.misc")
