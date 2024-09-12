return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Enable transparent background
      transparent = false,

      -- Enable italics comments
      italic_comments = false,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,

      -- Modern borderless telescope theme - also applies to fzf-lua
      borderless_telescope = false,

      -- Set terminal colors used in `:terminal`
      terminal_colors = true,

      -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
      -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
      cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

      theme = {
        variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

          -- Example:
          Comment = { fg = "#696969", bg = "NONE", italic = true },

          -- Complete list can be found in `lua/cyberdream/theme.lua`
        },

        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          return {
            Comment = { fg = colors.grey, bg = "NONE", italic = true },
            LineNr = { fg = colors.grey },
            GitSignsCurrentLineBlame = { fg = colors.cyan },
          }
        end,

        -- Override a color entirely
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- Example:
          bg = "#000000",
          green = "#00ff00",
          magenta = "#ff00ff",
        },
      },

      -- Disable or enable colorscheme extensions
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },
    })
    vim.cmd([[colorscheme cyberdream]])
  end,
}
