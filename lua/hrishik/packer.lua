-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'	--manage mason
	use {

		"williamboman/mason.nvim",
		run = ":MasonUpdate" --Mason updates register contents
	}


	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use "kyazdani42/nvim-web-devicons"

	--checking git
	--checking new line in gutter
	--git

	use "airblade/vim-gitgutter"
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use "mg979/vim-visual-multi"

	use "nvim-tree/nvim-tree.lua"

	--telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	--auto repairs
	use "windwp/nvim-autopairs"

end)


require("mason").setup()

