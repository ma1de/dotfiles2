local cmp = require('cmp')
local lspkind = require('lspkind')

--require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort,
        ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
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

    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'vsnip' },
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- because we are using the vsnip cmp plugin
        end,
  },
})
