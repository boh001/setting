local telescope = require("telescope")

telescope.load_extension("workspaces")

telescope.setup({
  theme = "tokyonight",
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = "ascending",
    layout_config = {
      width = 0.6,
      height = 0.6,
      preview_width = 0.4,
      prompt_position = 'top',
    },
  },
  extensions = {
    workspaces = {
      keep_insert = true,
    }
  },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-`>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-o>', "<cmd>Telescope workspaces<CR>", {})
vim.keymap.set('n', '<C-S-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-f-h>', builtin.help_tags, {})

