-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope.nvim
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	-- Themes
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})
	use({
		'folke/tokyonight.nvim',
	})
	use("oxfist/night-owl.nvim")
	use("scottmckendry/cyberdream.nvim")
	use({
		"ellisonleao/gruvbox.nvim"
	})
	use 'navarasu/onedark.nvim'

	use( -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	)
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter'
	}
	--- This is used for my own plugins
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')

	use('lewis6991/gitsigns.nvim') -- Git signs
	use('tpope/vim-fugitive')
	use('tpope/vim-commentary')
	use('tpope/vim-surround')

	use {
		'nvim-lualine/lualine.nvim', -- Fancier status line
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use 'lukas-reineke/indent-blankline.nvim' -- Indent guides
	use 'tpope/vim-sleuth'                 -- Automatically set indent settings

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Autocompletion
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	use("folke/zen-mode.nvim")

	-- copilot
	use('github/copilot.vim')
	use {
		"CopilotC-Nvim/CopilotChat.nvim",
	}
	use('christoomey/vim-system-copy')
	use('vim-scripts/argtextobj.vim')
	use('norcalli/nvim-terminal.lua')
	use({ 'j-hui/fidget.nvim' })
	use('neomake/neomake')
	-- tests
	use {
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
		}
	}
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	-- debug
	use("mfussenegger/nvim-dap")
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"nvim-neotest/nvim-nio",
		}
	})
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use("mfussenegger/nvim-dap-python")
	-- misc
	use { -- execute some things
		'stevearc/overseer.nvim',
		config = function() require('overseer').setup() end
	}
	use {
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim"
		}
	}
	-- used for gitemoji
	use 'olacin/telescope-gitmoji.nvim'

	use { 'jose-elias-alvarez/null-ls.nvim' }

	-- flutter
	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
	}

	-- latex packages
	use 'lervag/vimtex'

	-- python repl
	use 'Vigemus/iron.nvim'
end)
