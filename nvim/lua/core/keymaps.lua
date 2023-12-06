vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.wo.number = true
vim.opt.relativenumber = true

vim.cmd [[colorscheme gruber-darker]]

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>git', ':LazyGit<CR>')

require('mason').setup()
