local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
  'git',
  'clone',
  '--filter=blob:none',
  'https://github.com/folke/lazy.nvim.git',
  '--branch=stable', -- latest stable release
  lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'williamboman/mason.nvim'
  },

  {
    'nvim-tree/nvim-tree.lua'
  },

  {
    'nvim-tree/nvim-web-devicons'
  },

  {
    'rose-pine/neovim',
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('core.plugin.lualine')
    end
  },

  {
    'nvim-treesitter/nvim-treesitter'
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'williamboman/mason-lspconfig.nvim'
  },

  {
    'neovim/nvim-lspconfig'
  },

  {
    'rafamadriz/friendly-snippets'
  },

  {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
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
    'mfussenegger/nvim-dap'
  },

  {
    'mfussenegger/nvim-jdtls',
  },

  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension('lazygit')
    end
  },

  {
    'nvim-tree/nvim-web-devicons'
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      require('which-key').setup {}
    end
  },

  {
    'junegunn/fzf'
  },

  {
	  'hrsh7th/cmp-nvim-lsp'
  },

  {
    'hrsh7th/nvim-cmp'
  },

  {
    'onsails/lspkind.nvim'
  },

  {
    'andweeb/presence.nvim',
    config = function()
      require('core.plugin.presence')
    end
  },

  {
    "kylechui/nvim-surround"
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup();
    end
  },

  {
    "L3MON4D3/LuaSnip"
  },

  {
    "saadparwaiz1/cmp_luasnip"
  },

  {
    "simrat39/rust-tools.nvim"
  }
})
