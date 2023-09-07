
local configs = require("nvim-treesitter.configs")
configs.setup {
	autotag = {
		enable=true,
		enable_rename=true,
		enable_close=true,
		enable_close_on_slash = true,
		update_on_insert = true,
		filetypes={"html","xml","javascript","typescript","typescriptreact","javascriptreact"}
	},
	ensure_installed = {"javascript","lua","typescript","c","lua","rust","python"},
	sync_install = false, 
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
		
	},
	indent = { enable = true, disable = { "yaml" } },
}


