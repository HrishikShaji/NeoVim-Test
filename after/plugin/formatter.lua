function format_prettier()
   return {
     exe = "npx",
     args = {"prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
     stdin = true
   }
end

require('formatter').setup {
  logging = false,
  filetype = {
    typescript = { format_prettier },
    typescriptreact = { format_prettier },
  },
 require("formatter.filetypes.any").remove_trailing_whitespace

}

vim.api.nvim_create_autocmd("BufWritePost *",{command = "FormatWrite"})
