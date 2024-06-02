return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = true,
      italic_comments = false,
      hide_fillchars = false,
      borderless_telescope = false,
      terminal_colors = true,

      theme = {
        variant = "default", -- use "light" for the light variant
        highlights = {
          Comment = { fg = "#696969", bg = "NONE", italic = true },
        },

        colors = {
          bg = "#000000",
          green = "#00ff00",
          magenta = "#ff00ff",
        },
      },
    })
    vim.cmd([[colorscheme cyberdream]])
  end,
}
