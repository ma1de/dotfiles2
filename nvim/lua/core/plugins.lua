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
        "mfussenegger/nvim-jdtls",
	    ft = { "java" },
	    config = function()
	    	jdtls = require("jdtls")
    
	    	share_dir = os.getenv("HOME") .. "/.local/share"
	    	project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	    	workspace_dir = share_dir .. "/eclipse/" .. project_name

	    	-- Set proper Java executable
	    	java_cmd = "/usr/bin/java"
	    	mason_registry = require("mason-registry")

		    -- vim.fn.glob Is needed to set paths using wildcard (*)
	    	bundles = {
		    	vim.fn.glob(
		    			"$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
		    	),
	    	}

	    	vim.list_extend(
	    		bundles,
	    		vim.split(
	    			vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-test/extension/server/*.jar"),
	    			"\n"
	    		)
	    	)

	    	config = {
		    	cmd = {
	    			"java",
		    		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		    		"-Dosgi.bundles.defaultStartLevel=4",
		    		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		    		"-Dlog.protocol=true",
		    		"-Dlog.level=ALL",
                    "-javaagent:" .. "/usr/share/java/jdtls/lombok.jar",
		    		"-Xms512m",
		    		"-Xmx2048m",
		    		"--add-modules=ALL-SYSTEM",
		    		"--add-opens",
			    	"java.base/java.util=ALL-UNNAMED",
		    		"--add-opens",
			    	"java.base/java.lang=ALL-UNNAMED",
		    		"-jar",
		    		vim.fn.glob("/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		    		"-configuration",
		    		"/usr/share/java/jdtls/config_linux",
		    		"-data",
		    		workspace_dir,
		    	},
		    	flags = {
		    		debounce_text_changes = 150,
		    		allow_incremental_sync = true,
		    	},
		    	--root_dir = require("jdtls.setup").find_root({"build.gradle", "pom.xml", ".git"}),
		    	root_dir = jdtls.setup.find_root({ ".metadata", ".git" }),

		    	on_init = function(client)
			    	if client.config.settings then
		    			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			    	end
		    	end,

		    	init_options = {
		    		bundles = bundles,
		    	},
		    	capabilities = require('cmp_nvim_lsp').default_capabilities(),

			    on_attach = function(client, bufnr)
		    		if client.name == "jdtls" then
			    		vim.api.nvim_echo({ { "sdsd", "Normal" } }, true, {})

			    		require("which-key").register({
			    			["<leader>de"] = { "<cmd>DapContinue<cr>", "[JDLTS] Show debug configurations" },
			    			["<leader>ro"] = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "[JDLTS] Organize imports" },
			    		})
			    		jdtls = require("jdtls")
			    		jdtls.setup_dap({ hotcodereplace = "auto" })
			    		jdtls.setup.add_commands()
				    	-- Auto-detect main and setup dap config
				    	require("jdtls.dap").setup_dap_main_class_configs({
				    		config_overrides = {
				    			vmArgs = "-Dspring.profiles.active=local",
				    		},
			    		})
			    	end
		    	end,
		    	settings = {
			    	java = {
			    		signatureHelp = {
			    			enabled = true,
			    		},
				    	saveActions = {
				    		organizeImports = true,
				    	},
				    	completion = {
				    		maxResults = 20,
				    		favoriteStaticMembers = {
				    			"org.hamcrest.MatcherAssert.assertThat",
				    			"org.hamcrest.Matchers.*",
				    			"org.hamcrest.CoreMatchers.*",
				    			"org.junit.jupiter.api.Assertions.*",
					    		"java.util.Objects.requireNonNull",
					       		"java.util.Objects.requireNonNullElse",
					    		"org.mockito.Mockito.*",
				    		},
				    	},
				    	sources = {
				    		organizeImports = {
					    		starThreshold = 9999,
					    		staticStarThreshold = 9999,
					    	},
				    	},
				    	codeGeneration = {
				    		toString = {
				    			template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				    		},
				    	},
			    	},  
			    },
	    	}
		    jdtls.start_or_attach(config)
        end
    }
})
