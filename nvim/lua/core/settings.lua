vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.wo.number = true

require('nvim-tree').setup()

vim.wo.number = true
vim.opt.relativenumber = true

vim.cmd [[colorscheme rose-pine]]

-- [MAPPINGS START]

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

-- nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')

-- lazygit
vim.keymap.set('n', '<leader>git', ':LazyGit<CR>')

-- fuzzyfinder
vim.keymap.set('n', '<leader>fzf', ':FZF<CR>')

-- [MAPPINGS END]

require('mason').setup()
