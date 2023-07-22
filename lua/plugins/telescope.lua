local telescope = require("telescope")

telescope.setup({
  theme = "tokyonight",
  defaults = {
    layout_strategy = 'cursor',
    sorting_strategy = "ascending",
  }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-S-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-f-h>', builtin.help_tags, {})

