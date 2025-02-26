-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  -- { "ggml-org/llama.vim"},
  {'ryanoasis/vim-devicons'},
  { "dhruvasagar/vim-table-mode" },
  { "lunarvim/colorschemes" },
  { "tpope/vim-surround" },
  { "vim-scripts/Tagbar" },
  { "mattboehm/vim-unstack" },
  {'adimit/prolog.vim'},
  {
      "ldelossa/gh.nvim",
      dependencies = {
          {
          "ldelossa/litee.nvim",
          config = function()
              require("litee.lib").setup()
          end,
          },
      },
      config = function()
          require("litee.gh").setup()
      end,
  },

  -- COPILOT (*OFFICIAL* VERSION)
  {"github/copilot.vim"},
  { --python virtualenvs
    'AckslD/swenv.nvim',
    -- Should return a list of tables with a `name` and a `path` entry each.
    -- Gets the argu"ment `venvs_path` set below.
    -- By default just lists the entries in `venvs_path`.
    get_venvs = function(venvs_path)
      return require('swenv.api').get_venvs(venvs_path)
    end,
    -- Path passed to `get_venvs`.
    venvs_path = vim.fn.expand('~/envs'),
    -- Something to do after setting an environment, for example call vim.cmd.LspRestart
    -- post_set_venv = nil,
  },

  { -- nvim jupyter functionality
    'luk400/vim-jukit',
    ft = {"python", "ipynb", "notebook"},
    config = function()
      -- vim.g.jukit_shell_command = 'source ./env/bin/activate && ipython'
      -- vim.g.jukit_shell_command = 'source ~/code/ror/mmm/env/bin/activate && ipython'
      vim.g.jukit_shell_command = 'source $VIRTUAL_ENV/activate && ipython'
      -- vim.g.jukit_shell_command = '~/code/ror/mmm/env/bin/ipython'
      -- vim.g.jukit_shell_command = 'ipython'
      vim.g.jukit_terminal = 'tmux'
      -- vim.g.jukit_terminal = ''
      vim.g.jukit_inline_plotting = 0
      vim.g.jukit_layout = {
        split = 'horizontal',
        p1 = 0.5,
        val = {
          'file_content',
          {
            split = 'vertical',
            p1 = 0.5,
            val = {'output', 'output_history'},
          }
        }
      }
    end,
  },

  { --orgmode
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup({
        org_agenda_files = {'~/Dropbox/org/*', '~/notes/org/**/*'},
        org_default_notes_file = '~/notes/org/apporchid/todo.org',
      })
    end,
  },

  { -- mind mapper -- just trying it out
    'phaazon/mind.nvim',
    branch = 'v2.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require'mind'.setup()
    end
  },
}
-- -- Extra plugin config
--
-- COPILOT
vim.g.copilot_workspace_folders = "~/code/decision_nets"
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<RIGHT>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

-- Builtins
-- lvim.builtin.copilot = { active = true }
lvim.builtin.orgmode = { active = true }
lvim.builtin.mind = { active = true, root_path = "~/.mind" } -- enable/disable mind.nvim
lvim.builtin.python_programming = { active = true }

lvim.builtin.project.active = false -- will disable the project.nvim plugin

-- WhichKey
local wk = require("which-key")
wk.register({
  ["<leader>c"] = {
    name = "+Copilot",
    p = { "<cmd>Copilot panel<CR>", "Open suggestion panel" },
    -- a = { "<cmd>copilot#Accept<cr>", "Accept suggestion" },
    s = { "<cmd>Copilot status<cr>", "status" },
    v = { "<cmd>Copilot v<cr>", "version" },
    w = { "<cmd>echo g:copilot_workspace_folders", "workspace folders" },
  },
})

vim.opt.conceallevel = 1
-- vim.opt.concealcursor = 'nc'

-- Colorscheme
lvim.transparent_window = true

-- Appearance
vim.opt.cursorline=false
vim.opt.relativenumber=true

-- LSP
lvim.lsp.buffer_mappings.normal_mode['gk'] = { vim.lsp.buf.hover, "Show documentation" }
lvim.lsp.buffer_mappings.normal_mode['gu'] = { vim.lsp.buf.references, "Show usages" }
lvim.lsp.buffer_mappings.normal_mode['gr'] = { vim.lsp.buf.rename, "Rename" }
lvim.lsp.buffer_mappings.normal_mode['<Space>os'] = nil
-- NOTE: must hardcode the path to the virtualenv
lvim.lsp.buffer_mappings.normal_mode['<Space>os'] = { ":JukitOut source ~/code/decision_nets/env/bin/activate<CR>" }
-- lvim.lsp.buffer_mappings.normal_mode['<Space>os'] = { ":JukitOut source ~/code/ror/mmm/env/bin/activate<CR>" }
-- lvim.keys.normal_mode['os'] = { ":JukitOut source ~/code/ror/mmm/env/bin/activate<CR>" }

-- [[Six Vim]]

-- Saving
lvim.keys.normal_mode["s"] = ":w<CR>"
lvim.keys.normal_mode["q"] = ":q<CR>"

-- Motion
lvim.keys.normal_mode["H"] = "^"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.visual_mode["L"] = "$"
lvim.keys.normal_mode["J"] = "}"
lvim.keys.visual_mode["J"] = "}"
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.keys.normal_mode["K"] = "{"
lvim.keys.visual_mode["K"] = "{"

-- Comments
-- lvim.keys.normal_mode["<LEADER>c"] = # TODO toggle comments 
-- lvim.lsp.buffer_mappings.normal_mode['<Space>c'] = nil
-- lvim.keys.normal_mode['<Space>c'] = nil
-- lvim.lsp.buffer_mappings.normal_mode['<LEADER>c'] = nil
-- lvim.keys.normal_mode['<LEADER>c'] = nil
lvim.builtin.which_key.mappings["c"] = nil

-- Buffers
lvim.keys.normal_mode["B"] = ":buffers<cr>:buffer<space>"
lvim.keys.normal_mode["<CR>"] = ":bn<cr>"

-- Marks
lvim.keys.normal_mode["M"] = ":marks<cr>"

-- Splits
lvim.keys.normal_mode["t"] = "<c-w>w"
-- TODO get these working with tmux somehow
lvim.keys.normal_mode["<c-K>"] = "<c-w>k"
lvim.keys.normal_mode["<c-J>"] = "<c-w>j"
lvim.keys.normal_mode["<c-H>"] = "<c-w>h"
lvim.keys.normal_mode["<c-L>"] = "<c-w>l"

-- Tags
lvim.keys.normal_mode["T"] = ":TagbarToggle<CR>"

lvim.colorscheme = "system76"

-- indent based folding
vim.cmd([[
  "Folding
  "zM fold all
  "zR unfold all
  "set foldmethod=indent
  set nofoldenable
  nnoremap f zm
  nnoremap F zr
  set foldmethod=expr
  set foldexpr=FoldMethod(v:lnum)

  function! FoldMethod(lnum)
    "get string of current line
    let crLine=getline(a:lnum)

    " check if empty line
    if empty(crLine) "Empty line or end comment
      return -1 " so same indent level as line before
    endif

    " check if comment
    let a:data=join( map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")') )
    if a:data =~ ".*omment.*"
      return '='
    endif

    "Otherwise return foldlevel equal to indent /shiftwidth (like if
    "foldmethod=indent)
    else  "return indent base fold
      return indent(a:lnum)/&shiftwidth
  endfunction

  set completeopt+=longest

  " nnoremap <leader>os :call jukit#splits#output()<cr>
  " nnoremap <leader>os :JukitOut source ./env/bin/activate<cr>
]])
