---@diagnostic disable: undefined-global
-- lazy.nvim plugin spec — drop into your plugins/ dir or return it from a spec.
-- Makes one vimrc behave correctly under BOTH tmux and herdr.
--
-- herdr sets HERDR_ENV=1 in every pane it spawns (verified in herdr
-- src/main.rs: HERDR_ENV_VAR="HERDR_ENV", HERDR_ENV_VALUE="1"). tmux sets $TMUX.
--
-- Under tmux : vim-tmux-navigator loads and owns seamless C-h/j/k/l as before.
-- Under herdr: the `cond` below returns false, so the plugin NEVER loads.
--              herdr captures C-h/j/k/l globally before Neovim sees them, so
--              its maps would be dead anyway. Use native C-w h/j/k/l for splits.
--
-- (`vim` is a false-undefined here for lua_ls outside a Neovim runtime; the
--  disable directive on line 1 silences it. It resolves fine inside Neovim.)

return {
  "christoomey/vim-tmux-navigator",
  cond = function()
    local tmux  = vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
    local herdr = vim.env.HERDR_ENV == "1"
    return tmux and not herdr
  end,
  cmd = {
    "TmuxNavigateLeft", "TmuxNavigateDown",
    "TmuxNavigateUp",   "TmuxNavigateRight",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
  },
}

-- Splits under herdr use native motions — no extra maps by design:
--   <C-w>h  <C-w>j  <C-w>k  <C-w>l
--
-- Optional, add to your init.lua so vim yanks share herdr's system clipboard:
--   vim.opt.clipboard = "unnamedplus"
