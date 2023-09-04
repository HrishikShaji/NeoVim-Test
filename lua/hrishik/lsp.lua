


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

require("lspconfig").pyright.setup{
	capabilities=capabilities,
	on_attach = function() print("Running pyright Server")
		vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
		vim.keymap.set("n","gd",vim.lsp.buf.definifion,{buffer=0})
		vim.keymap.set("n","gt",vim.lsp.buf.type_definifion,{buffer=0})
		vim.keymap.set("n","gm",vim.lsp.buf.implementation,{buffer=0})
	end
}

require('lspconfig').lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          library = { vim.env.VIMRUNTIME }
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = vim.api.nvim_get_runtime_file("", true)
        }
      })

      client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
    end
    return true
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


