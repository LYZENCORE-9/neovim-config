return {
    {
        "nvim-treesitter/nvim-treesitter",

        branch = "main",

        build = ":TSUpdate",

        config = function()
            local configs = require("nvim-treesitter")

            configs.setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "vim",
                    "vimdoc",
                    "cmake",
                    "json",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "python",
                },
            })
        end,
    },
}
