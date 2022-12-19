vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected line up

vim.keymap.set("n", "J", "mzJ`z") -- delete the line below
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down but centered
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up but centered
vim.keymap.set("n", "n", "nzzzv") -- Center when forward searching
vim.keymap.set("n", "N", "Nzzzv") -- Center when backward searching

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the current word with the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local toggle_search_mode = false
vim.keymap.set("n", "<leader>k", function()
	if toggle_search_mode then
		vim.cmd("nohl")
		toggle_search_mode = false
	else
		vim.cmd("/" .. vim.fn.expand("<cword>"))
		vim.cmd("normal! N")
		toggle_search_mode = true
	end
end)
