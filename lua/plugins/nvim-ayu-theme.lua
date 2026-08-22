return {
    {
        "Shatur/neovim-ayu",

        lazy = false,
        priority = 1000,

        config = function()
            require("ayu").setup({
                mirage = false, -- false = ayu dark, true = ayu mirage
            })

            vim.cmd.colorscheme("ayu-dark")
        end,
    },
}
