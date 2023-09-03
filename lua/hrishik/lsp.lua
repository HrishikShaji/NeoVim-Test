local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").tsserver.setup{
	capabilities=capabilities,
	on_attach = function() print("Running Typescript Server")
		vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
		vim.keymap.set("n","gd",vim.lsp.buf.definifion,{buffer=0})
		vim.keymap.set("n","gt",vim.lsp.buf.type_definifion,{buffer=0})
		vim.keymap.set("n","gm",vim.lsp.buf.implementation,{buffer=0})
	end
}

vim.opt.completeopt = {"menu","menuone","noselect"}

local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) 
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, 
	}, {
			{ name = 'buffer' },
		})
})


