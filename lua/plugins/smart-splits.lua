return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    local splits = require("smart-splits")
    vim.keymap.set("n", "<C-w>r", splits.start_resize_mode)
  end
}
