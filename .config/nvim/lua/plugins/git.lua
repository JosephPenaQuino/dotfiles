return {
    {
	'JosephPenaQuino/committer.nvim',
	config = function()
	    require("committer").setup()
	end,
	dependencies = {
	    'nvim-telescope/telescope.nvim',
	    'olacin/telescope-gitmoji.nvim',
	    'nvim-lua/plenary.nvim',
	},
    }
}
