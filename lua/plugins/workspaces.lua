return {
  "natecraddock/workspaces.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("workspaces").setup({
      workspaces = {
        {
          name = "nvim",
          path = "~/.config/nvim"
        },
        {
          name = "projects",
          path = "~/projects"
        },
      },
      sort = false,
      hooks = {
        open = { "Telescope find_files hidden=true" }
      }
    })
  end
}
