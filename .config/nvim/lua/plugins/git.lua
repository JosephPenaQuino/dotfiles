return {
    { 'rhysd/git-messenger.vim' },
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },
    {
	'JosephPenaQuino/committer.nvim',
	config = function()
	    require("committer").setup()
	end,
	dependencies = {
	    'nvim-telescope/telescope.nvim',
	    'olacin/telescope-gitmoji.nvim',
	    'olacin/telescope-cc.nvim',
	    'nvim-lua/plenary.nvim',
	},
    }
}
