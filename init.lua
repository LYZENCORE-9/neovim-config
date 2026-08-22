vim.o.guifont = "JetBrainsMono Nerd Font:h10"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("config.dap")
require("config.keymaps")

-- *********************** 
-- UI Configuration
-- ***********************

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] =
vim.lsp.with(
    vim.lsp.handlers.hover,
    {
         border = "rounded",
     }
)

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },

    signs = true,

    underline = true,

    update_in_insert = false,

    severity_sort = true,

    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local signs = {
    Error = "󰅚 ",
    Warn  = "󰀪 ",
    Hint  = "󰌶 ",
    Info  = "󰋽 ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type

    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = "",
    })
end

