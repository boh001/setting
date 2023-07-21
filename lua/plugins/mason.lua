require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "cssls",
    "eslint",
    "html",
    "tsserver",
  },
  automatic_installation = true
})

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = 'nvim_lsp' }
  }
})

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities
})
lspconfig.cssls.setup({
  capabilities = capabilities
})
lspconfig.eslint.setup({
  capabilities = capabilities
})
lspconfig.html.setup({
  capabilities = capabilities
})
lspconfig.tsserver.setup({
  capabilities = capabilities
})

