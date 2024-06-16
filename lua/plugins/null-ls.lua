return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
    },
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-shellcheck.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "codespell",
        "prettierd",
        "eslint_d",
      },
      automatic_installation = true,
    })

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- any filetype
        null_ls.builtins.formatting.codespell,
        -- lua
        null_ls.builtins.formatting.stylua,
        -- sh
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
        -- typescript
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        -- terraform
        null_ls.builtins.formatting.terraform_fmt,
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  end,
}
