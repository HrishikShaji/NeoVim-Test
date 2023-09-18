vim.cmd [[packadd packer.nvim]]

--simple line
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' --manage mason
	use "kyazdani42/nvim-web-devicons"
	use "nvim-tree/nvim-tree.lua"
	use "windwp/nvim-autopairs"
	use "windwp/nvim-ts-autotag"
	use "ellisonleao/gruvbox.nvim"
	use "mhartington/formatter.nvim"

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"saadparwaiz1/cmp_luasnip"},
			{"hrsh7th/cmp-nvim-lua"},
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
			{"rafamadriz/friendly-snippets"}

		}
	}

	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}


	--another just

	--adding juust a line
end)

require("mason").setup()
