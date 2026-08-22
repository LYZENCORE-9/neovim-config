return {
    {
        "neovim/nvim-lspconfig",

        config = function()

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                },

                capabilities = capabilities,
            })

            vim.lsp.enable("clangd")

            -- CMake LSP setup
            vim.lsp.config("neocmake", {
                cmd = { "neocmake" },
                capabilities = capabilities,
                init_options = {
                    format = {
                        enable = true,
                    },
                },
            })
            vim.lsp.enable("neocmake")
	    

        end,
    },
}
