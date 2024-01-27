local splits = require("smart-splits")

splits.setup({})

vim.keymap.set("n", "<C-w>r", splits.start_resize_mode)
