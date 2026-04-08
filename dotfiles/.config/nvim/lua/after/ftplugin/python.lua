return { -- nvim jupyter functionality
  "luk400/vim-jukit",
  ft = { "python", "ipynb", "notebook" },
  config = function()
    vim.g.jukit_shell_command = "source $VIRTUAL_ENV/activate && ipython"
    vim.g.jukit_terminal = "tmux"
    -- vim.g.jukit_terminal = ''
    vim.g.jukit_inline_plotting = 0
    vim.g.jukit_layout = {
      split = "horizontal",
      p1 = 0.5,
      val = {
        "file_content",
        {
          split = "vertical",
          p1 = 0.5,
          val = { "output", "output_history" },
        },
      },
    }
  end,
}
