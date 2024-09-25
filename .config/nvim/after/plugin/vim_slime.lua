vim.g.slime_target = "tmux"
vim.g.slime_cell_delimiter = "#%%"
vim.g.slime_default_config = { socket_name = "default", target_pane = "0" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1

vim.api.nvim_set_keymap('x', '<leader>s', '<Plug>SlimeRegionSend', {})
vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>SlimeMotionSend', {})
vim.api.nvim_set_keymap('n', '<leader>ss', '<Plug>SlimeLineSend', {})
vim.api.nvim_set_keymap('n', '<leader>sc', '<Plug>SlimeSendCell', {})
vim.api.nvim_set_keymap('n', '<leader>sp', '<Plug>SlimeParagraphSend', {})
