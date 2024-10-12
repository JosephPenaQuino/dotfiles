local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tF', builtin.find_files, {})
vim.keymap.set('n', '<leader>tG', function()
    builtin.git_files({ recurse_submodules = true })
end, {})
vim.keymap.set('n', '<leader>tg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>tB', builtin.buffers, {})

-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tH', builtin.help_tags, {})


vim.keymap.set('n', '<leader>tD', ":Telescope diagnostics<CR>")
