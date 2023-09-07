local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings to magical LSP functions!
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '#', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', '@', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '!', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lspconfig = require("lspconfig")
local servers = { "tailwindcss", "tsserver", "jsonls", "pyright" }

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup {
		capabilities = capabilities,
		on_attach = on_attach
	}
end



lspconfig.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

lspconfig.html.setup {
	on_attach = on_attach,
	capabilities = capabilities
}


lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}



vim.opt.completeopt = { "menu", "menuone", "noselect" }

local luasnip = require("luasnip")
require("luasnip.loaders.from_lua").lazy_load()
-- set keybinds for both INSERT and VISUAL.
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
-- Set this check up for nvim-cmp tab mapping
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'

require("luasnip.loaders.from_vscode").lazy_load()

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
		{ name = "buffer" },
		{ name = "path" }
	})
})
