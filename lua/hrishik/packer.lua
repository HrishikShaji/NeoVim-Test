vim.cmd [[packadd packer.nvim]]

--simple line
require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'	--manage mason
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "rafamadriz/friendly-snippets"
	use "kyazdani42/nvim-web-devicons"
	use "mg979/vim-visual-multi"
	use "nvim-tree/nvim-tree.lua"
	use "windwp/nvim-autopairs"
	use "windwp/nvim-ts-autotag"
	use "lewis6991/gitsigns.nvim"
	use "akinsho/bufferline.nvim"
	use "moll/vim-bbye"
	use "ellisonleao/gruvbox.nvim"
	use 'mfussenegger/nvim-lint'
	use "mhartington/formatter.nvim"
    	use "lukas-reineke/lsp-format.nvim"
	use 'sbdchd/neoformat'
	use 'dense-analysis/ale'

	use{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}



	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}


	--another just

	--adding juust a line
end)

require("mason").setup()
