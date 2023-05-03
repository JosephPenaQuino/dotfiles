-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope.nvim
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})
	use(-- Highlight, edit, and navigate code
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
	use 'tpope/vim-sleuth' -- Automatically set indent settings

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
	use('github/copilot.vim')
	use('christoomey/vim-system-copy')
	use('vim-scripts/argtextobj.vim')
	use('norcalli/nvim-terminal.lua')
	use('j-hui/fidget.nvim')
	use('neomake/neomake')
end)
