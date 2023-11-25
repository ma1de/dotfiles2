local on_attach = require('plugins.configs.lspconfig').on_attach 
local capabilities = require('plugins.configs.lspconfig').capabilities
local lspconfig = require('lspconfig')
local util = require 'lspconfig/util'

local plugins = { "clangd", "pylyzer", "html", "cssls", "tsserver" }

for _, lsp in ipairs(plugins) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
