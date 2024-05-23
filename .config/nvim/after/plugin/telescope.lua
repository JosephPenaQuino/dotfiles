local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tF', builtin.find_files, {})
vim.keymap.set('n', '<leader>tG', function()
	builtin.git_files({recurse_submodules = true})
end, {})
vim.keymap.set('n', '<leader>tg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>tB', builtin.buffers, {})

-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tH', builtin.help_tags, {})


vim.keymap.set('n', '<leader>tD', ":Telescope diagnostics<CR>")

local telescope = require('telescope')

telescope.setup({
    extensions = {
        gitmoji = {
            action = function(entry)
                -- entry = {
                --   display = "🐛 Fix a bug.",
                --   index = 4,
                --   ordinal = "Fix a bug.",
                --   value = {
                --     description = "Fix a bug.",
                --     text = ":bug:",
                --     value = "🐛"
                --   }
                -- }
                local emoji = entry.value.value
                vim.ui.input({ prompt = "Enter commit message: " .. emoji .. " "}, function(msg)
                    if not msg then
                        return
                    end
                    -- Insert text instead of emoji in message
                    local emoji_value = entry.value.value
                    vim.cmd(':G commit -m "' .. emoji_value .. ' ' .. msg .. '"')
                end)
            end,
        },
    },
})

telescope.load_extension("gitmoji")
vim.keymap.set('n', '<leader>m', telescope.extensions.gitmoji.gitmoji)
