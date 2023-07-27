require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "cssls",
    "eslint",
    "html",
    "tsserver",
    "marksman",
    'dockerls',
    'terraformls',
  },
  automatic_installation = true
})
require("mason-null-ls").setup({
  ensure_installed = {
    "prettier",
  },
  automatic_installation = true
})
