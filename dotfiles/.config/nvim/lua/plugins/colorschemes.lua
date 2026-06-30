return {
    { "lunarvim/colorschemes" },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
        config = function(_, opts)
            require("cyberdream").setup(opts)
            vim.cmd.colorscheme("cyberdream")
            vim.api.nvim_set_hl(0, "Folded", { fg = "#5ea1ff", bg = "#1e2030" })
        end,
    },
}
