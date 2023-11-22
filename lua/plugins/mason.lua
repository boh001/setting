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
    'tailwindcss',
    'prismals',
    'clangd',
    "asm_lsp",
    "cmake"
  },
  automatic_installation = true
})
require("mason-null-ls").setup({
  ensure_installed = {
    "prettierd",
    'shellcheck',
    'clang_format',
    'stylua',
    'asmfmt',
    "cmakelang",
    "cmakelint",
  },
  automatic_installation = true
})
