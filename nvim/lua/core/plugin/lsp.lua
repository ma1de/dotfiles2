local servers = {"lua_ls", "html", "cssls", "clangd", "pylyzer", "tsserver", "gopls", "gradle_ls"};

require('mason-lspconfig').setup({
    ensure_installed = servers
})

local function on_attach(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true
        },
    }
  }
}
