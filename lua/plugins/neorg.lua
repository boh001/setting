return {
  "nvim-neorg/neorg",
  dependencies = { "vhyrro/luarocks.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              neorg = "~/projects/neorg",
            },
            default_workspace = "neorg",
          },
        },
      },
    })

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
