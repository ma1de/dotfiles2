local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "williamboman/mason.nvim"
    },

    {
        "nvim-tree/nvim-tree.lua"
    },

    {
        "nvim-tree/nvim-web-devicons"
    },

    {
        "rose-pine/neovim",
        name = "rosepine"
    },

    {
        "nvim-lualine/lualine.nvim"
    },

    {
        "nvim-treesitter/nvim-treesitter"
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    {
        "williamboman/mason-lspconfig.nvim"
    },

    {
        "neovim/nvim-lspconfig"
    },

    {
        'hrsh7th/nvim-cmp',
    },

    {
        'hrsh7th/cmp-nvim-lsp'
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets'
        }
    },

    {
        'saadparwaiz1/cmp_luasnip'
    },

    {
        "rafamadriz/friendly-snippets"
    },

    {
        "tribela/vim-transparent"
    },

    {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },

    {
        "judaew/ronny.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("ronny")
            require("ronny").setup()
        end
    },

    {
        "nanozuki/tabby.nvim"
    },

    {
        "EdenEast/nightfox.nvim"
    },

    {
        'saecki/crates.nvim',
        tag = 'stable',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end
    },

    {
        "andweeb/presence.nvim",
        config = function()
            require('core.plugin_config.presence')
        end
    },

    {
        "simrat39/rust-tools.nvim",
        config = function()
            require('core.plugin_config.rust-tools')
        end
    },

    {
        'mfussenegger/nvim-dap'
    },

    {
        'mfussenegger/nvim-jdtls',
        filetype = {"java"},
        config = function()
            require('core.plugin_config.jdtls')
        end
    },
})
