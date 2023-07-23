local workspaces = require("workspaces")
workspaces.setup({
  sort = false,
  hooks = {
    open = "NvimTreeOpen",
  }
})
