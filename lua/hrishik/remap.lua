vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

--nvim-tree file explorer
vim.keymap.set("n","<c-x>",":NvimTreeToggle<cr>",opts)

--telescope file finder
vim.keymap.set("n", "<c-s>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
vim.keymap.set("n", "<c-w>", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({previewer=false}))<cr>", opts)
