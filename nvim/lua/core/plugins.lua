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
        "nvim-lualine/lualine.nvim",
        config = function()
            require('core.plugin_config.lualine')
        end
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
        "hrsh7th/cmp-vsnip"
    },

    {
        "hrsh7th/vim-vsnip"
    },

    {
        "onsails/lspkind.nvim"
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
    },

    {
        "blazkowolf/gruber-darker.nvim",
        opts = {
            bold = true,
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = false,
            },
        }
    },

     {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require('telescope').load_extension('lazygit')
        end
    },

    {
        "nvim-tree/nvim-web-devicons"
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            require('which-key').setup {}
        end
    },

    {
        "junegunn/fzf"
    },

    -- god forgive me for what im about to do
    {
        'OmniSharp/omnisharp-vim'
    },
})
