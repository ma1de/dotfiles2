local cmp = require('cmp')
local lspkind = require('lspkind')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-n>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),

    formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function (_, vim_item)
              return vim_item
          end
        })
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }
    }),

    snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
    },
})
