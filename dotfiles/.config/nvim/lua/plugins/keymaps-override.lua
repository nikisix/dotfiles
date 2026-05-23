return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- nvim-lspconfig is lazy (BufReadPre). Its config() registers K→hover
      -- into Snacks's by_lsp table. BufReadPost fires after that config runs,
      -- so we can remove K from the registry before any LSP attaches.
      vim.api.nvim_create_autocmd("BufReadPost", {
        once = true,
        callback = function()
          Snacks.keymap.del("n", "K", { lsp = {} })
        end,
      })
    end,
  },
}
