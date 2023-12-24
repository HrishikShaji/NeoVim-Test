vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("colorscheme tokyonight-moon")
vim.api.nvim_set_hl(0,"Normal",{bg="none"})
vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})
vim.opt.clipboard="unnamedplus"
vim.keymap.set('n','y','"+y')
vim.keymap.set('n','yy','"+yy')
vim.keymap.set('n','Y','"+Y')
vim.keymap.set('x','y','"+y')
vim.keymap.set('x','Y','"+Y')
