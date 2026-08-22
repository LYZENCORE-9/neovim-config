return {
    {
        "nvim-neo-tree/neo-tree.nvim",

        branch = "v3.x",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        config = function()

            require("neo-tree").setup({

                filesystem = {

                    bind_to_cwd = true,

                    follow_current_file = {
                        enabled = true,
                    },

                    hijack_netrw_behavior = "open_current",

                },

            })

        end,
    },
}
