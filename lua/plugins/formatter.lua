-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace;
      function()
        return {
          exe = "prettierd",
          cwd = vim.fn.expand("%:p:h"),
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    }
  }
}

vim.keymap.set('n', '<leader>f', ":Format<CR>")
