local null_ls = require("null-ls")

local shellcheck = null_ls.builtins.code_actions.shellcheck
local prettier = null_ls.builtins.formatting.prettier
local clangFormat = null_ls.builtins.formatting.clang_format

local sources = {
  shellcheck,
  prettier,
  clangFormat,
}

null_ls.setup({ sources = sources })

local format = function()
  vim.lsp.buf.format({ timeout_ms = 2000 })
end

vim.keymap.set('n', ',f', format)
