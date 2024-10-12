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
                -- Just insert the text instead of commiting
                local pos = vim.api.nvim_win_get_cursor(0)[2]
                local line = vim.api.nvim_get_current_line()
                local nline = line:sub(0, pos) .. emoji .. line:sub(pos + 1)
                vim.api.nvim_set_current_line(nline)
            end,
        },
    },
})

telescope.load_extension("gitmoji")
vim.keymap.set('n', '<leader>m', telescope.extensions.gitmoji.gitmoji)
