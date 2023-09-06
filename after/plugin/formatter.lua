function format_prettier()
   return {
     exe = "npx",
     args = {"prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
     stdin = true
   }
end

require('formatter').setup {
  logging = true,
  filetype = {
    typescript = { format_prettier },
    typescriptreact = { format_prettier },
  }
}
