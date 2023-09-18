local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.keymap.set("n","<leader><leader>",vim.cmd.Ex)
--telescope file finder
vim.keymap.set("n", "<c-s>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
vim.keymap.set("n", "<c-w>", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({previewer=false}))<cr>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

