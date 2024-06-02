return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      toggler = {
        line = '<leader>c',
      },
      opleader = {
        block = '<leader>c'
      },
      mappings = {
        basic = true,
        extra = false
      }
    })
  end
}
