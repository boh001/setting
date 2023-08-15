local workspaces = require("workspaces")
workspaces.setup({
  sort = false,
  hooks = {
    open = { "Telescope find_files" }
  }
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd([[WorkspacesSyncDir]])
  end
})
