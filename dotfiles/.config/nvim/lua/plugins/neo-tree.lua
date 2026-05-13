return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- This makes hidden files visible by default
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
    lazy = false, -- neo-tree will lazily load itself
  }
}
