require("fzf-lua").setup()
require("trouble").setup()
-- s→:w and f/F→folds are user keymaps; drop those from flash's char mode
require("flash").setup({
    modes = { char = { keys = { "t", "T", ";", "," } } },
})
require("grug-far").setup()
