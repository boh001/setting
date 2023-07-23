local workspaces = require("workspaces")
workspaces.setup({
    hooks = {
        open = "NvimTreeOpen",
    }
})

workspaces.add_dir("~/projects")
