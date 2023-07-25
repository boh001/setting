local null_ls = require("null-ls")

local prettier = null_ls.builtins.formatting.prettier

local sources = {
  prettier
}

null_ls.setup({ sources = sources })

local format = function()
  vim.lsp.buf.format({ timeout_ms = 2000 })
end

vim.keymap.set('n', ',f', format)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = '',
  callback = format
})
