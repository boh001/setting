return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    bufferline.setup({
      options = {
        diagnostics = "nvim_lsp",
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        right_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        style_preset = bufferline.style_preset.no_italic,
      },

      highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = "#000000" },
          },
          mocha = {
            background = { fg = mocha.text },
          },
          latte = {
            background = { fg = "#000000" },
          },
        },
      }),
    })
  end,
}
