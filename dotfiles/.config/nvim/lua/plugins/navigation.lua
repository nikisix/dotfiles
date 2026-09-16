require("fzf-lua").setup()
require("trouble").setup()
-- s→:w, f/F→folds, and T→Tagbar are user keymaps; drop those from flash's char mode
require("flash").setup({
    modes = { char = { keys = { "t", ";", "," } } },
})
require("grug-far").setup()
