require("todo-comments").setup()

vim.keymap.set('n', '<leader>tT', function()
    vim.cmd(":TodoTelescope")
end)
