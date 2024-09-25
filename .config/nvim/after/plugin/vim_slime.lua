vim.g.slime_target = "tmux"
vim.g.slime_cell_delimiter = "# %%"
vim.g.slime_default_config = { socket_name = "default", target_pane = "0" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1

vim.api.nvim_set_keymap('x', '<leader>s', '<Plug>SlimeRegionSend', {})
vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>SlimeMotionSend', {})
vim.api.nvim_set_keymap('n', '<leader>ss', '<Plug>SlimeLineSend', {})
vim.api.nvim_set_keymap('n', '<leader>sc', '<Plug>SlimeSendCell', {})
vim.api.nvim_set_keymap('n', '<leader>sp', '<Plug>SlimeParagraphSend', {})

-- Keymaps for improving cell navigation
-- Function to move to the next cell (marked by # %%)
vim.api.nvim_set_keymap('n', ']l', [[:lua vim.fn.search('# %%', 'W')<CR>]], { noremap = true, silent = true })
-- Function to move to the previous cell (marked by # %%)
vim.api.nvim_set_keymap('n', '[l', [[:lua vim.fn.search('# %%', 'bW')<CR>]], { noremap = true, silent = true })


-- Create a namespace for virtual text
local ns_id = vim.api.nvim_create_namespace("virtual_line_namespace")

-- Function to render or remove the continuous horizontal line based on '# %%'
local function render_virtual_line()
    -- Clear existing virtual lines in the namespace
    vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)

    -- Get the current buffer
    local buf = vim.api.nvim_get_current_buf()

    -- Loop through all lines in the buffer
    local total_lines = vim.api.nvim_buf_line_count(buf)
    for i = 1, total_lines do
        local line = vim.api.nvim_buf_get_lines(buf, i - 1, i, false)[1]

        -- Check if the line starts with '# %%'
        if line:match("^# %%") then
            -- Add virtual text with a continuous line above the found line
            vim.api.nvim_buf_set_extmark(buf, ns_id, i - 2, 0, {
                virt_text = { { "───────────────────────────────────────────────────────────────────────────────", "Comment" } },  -- Styled as a comment
                virt_text_pos = "overlay",
            })
        end
    end
end

-- Auto command to apply the virtual line rendering when opening, changing, or entering a Python buffer
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter", "TextChanged", "TextChangedI" }, {
    pattern = "*.py",
    callback = render_virtual_line
})

