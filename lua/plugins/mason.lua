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
    'jsonls',
    'bashls',
    'docker_compose_language_service',
  },
  automatic_installation = true
})
require("mason-null-ls").setup({
  ensure_installed = {
    "prettier",
    'shellcheck',
  },
  automatic_installation = true
})
