return {
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            "windwp/nvim-autopairs",
            "onsails/lspkind.nvim",
        },

        event = "InsertEnter",

        config = function()

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            require("nvim-autopairs").setup({})


            cmp.setup({

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },


                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },


                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                    }),
                },


                mapping = cmp.mapping.preset.insert({

                    -- Trigger completion
                    ["<C-Space>"] = cmp.mapping.complete(),


                    -- Confirm selection
                    ["<CR>"] = cmp.mapping.confirm({
                        select = true,
                    }),


                    -- Navigate menu
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),


                    -- Scroll docs
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),


                    -- Tab completion
                    ["<Tab>"] = cmp.mapping(function(fallback)

                        if cmp.visible() then
                            cmp.select_next_item()

                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()

                        else
                            fallback()
                        end

                    end, { "i", "s" }),


                    ["<S-Tab>"] = cmp.mapping(function(fallback)

                        if cmp.visible() then
                            cmp.select_prev_item()

                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)

                        else
                            fallback()
                        end

                    end, { "i", "s" }),

                }),


                sources = cmp.config.sources({

                    {
                        name = "nvim_lsp",
                    },

                    {
                        name = "luasnip",
                    },

                    {
                        name = "path",
                    },

                }, {

                    {
                        name = "buffer",
                    },

                }),
            })


            -- Connect autopairs with cmp
            local cmp_autopairs =
                require("nvim-autopairs.completion.cmp")

            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )

        end,
    },
}
