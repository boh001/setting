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
        "rustfmt",
      },
      automatic_installation = true,
      debug = true,
    })

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- sh
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
        require("none-ls-shellcheck.code_actions"),
        -- groovy
        null_ls.builtins.formatting.npm_groovy_lint,
        -- typescript
        -- require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        null_ls.builtins.formatting.prettierd,
        -- rust
        require("none-ls.formatting.rustfmt"),
        -- golang
        null_ls.builtins.formatting.goimports_revise,
        null_ls.builtins.diagnostics.golangci_lint,
        -- terraform
        null_ls.builtins.formatting.terraform_fmt,
        --xml
        null_ls.builtins.formatting.xmllint,
        -- any filetype
        null_ls.builtins.formatting.codespell,
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  end,
}
