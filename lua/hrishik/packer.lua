vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'	--manage mason
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "kyazdani42/nvim-web-devicons"
	use "airblade/vim-gitgutter"
	use "mg979/vim-visual-multi"
	use "nvim-tree/nvim-tree.lua"
	use "windwp/nvim-autopairs"
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




end)

require("mason").setup()
