-- ****************************************
-- Debugger Keymaps
-- ***************************************
local dap = require("dap")


vim.keymap.set("n", "<F5>", dap.continue)

vim.keymap.set("n", "<F10>", dap.step_over)

vim.keymap.set("n", "<F11>", dap.step_into)

vim.keymap.set("n", "<F12>", dap.step_out)


vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

vim.keymap.set(
    "n",
    "<leader>B",
    function()
        dap.set_breakpoint(
            vim.fn.input("Breakpoint condition: ")
        )
    end
)
-- *********************** 
-- Telescope Keymaps
-- ***********************
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- *********************** 
-- Oil Filemanager Keymaps
-- ***********************

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
    desc = "Open parent directory",
})
-- *********************** 
-- Neo Tree Sidebar Keymaps
-- ***********************
vim.keymap.set("n", "<leader>l", ":Neotree toggle<CR>")
-- *********************** 
-- Diagnostic Keymaps 
-- ***********************
-- Show diagnostic message under cursor
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
    desc = "Show diagnostic error"
})

-- Go to next error
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic"
})

-- Go to previous error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic"
})

-- Show hover documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover, {
    desc = "LSP hover"
})
