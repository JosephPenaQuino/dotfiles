local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', builtin.find_files, {})
vim.keymap.set('n', '<leader>G', builtin.git_files, {})
vim.keymap.set('n', '<leader>g', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>B', builtin.buffers, {})

-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>H', builtin.help_tags, {})