return {
  "yamatsum/nvim-cursorline",
  config = function()
    require("nvim-cursorline").setup({
      cursorline = {
        enable = false,
      },
      cursorword = {
        enable = true,
        min_length = 1,
        hl = { underline = true },
      }
    })
  end
}
