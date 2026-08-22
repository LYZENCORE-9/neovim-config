local dap = require("dap")

dap.adapters.codelldb = {
    type = "server",

    port = "${port}",

    executable = {
        command = "codelldb",
        args = {
            "--port",
            "${port}",
        },
    },
}


dap.configurations.cpp = {
    {
        name = "Launch C++",

        type = "codelldb",

        request = "launch",

        program = function()
            return vim.fn.input(
                "Executable: ",
                vim.fn.getcwd() .. "\\build\\"
            )
        end,

        cwd = "${workspaceFolder}",

        stopOnEntry = false,
    },
}


dap.configurations.c = dap.configurations.cpp
