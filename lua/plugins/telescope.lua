local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.load_extension("workspaces")

telescope.setup({
  theme = "tokyonight",
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = "ascending",
    layout_config = {
      width = 0.6,
      height = 0.6,
      prompt_position = 'top',
    },
    file_ignore_patterns = {
      "^node_modules/",
      "^.git/",
      "^.zsh_sessions/"
    },
    mappings = {
      n = {
        ["<c-d>"] = actions.delete_buffer,
      },
      i = {
        ["<c-d>"] = actions.delete_buffer,
      },
    },
    find_command = { "fd", "-t=f", "-a" },
    path_display = { "absolute" },
    wrap_results = true
  },
  extensions = {
    workspaces = {
      keep_insert = true,
    }
  },
})

local builtin = require('telescope.builtin')

local find_files = function()
  builtin.find_files({ hidden = true })
end

local find_references = function()
  builtin.lsp_references({
    show_line = false,
  })
end

vim.keymap.set('n', '<C-]>', find_files, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-o>', "<cmd>Telescope workspaces<CR>", {})
vim.keymap.set('n', '<C-l>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-f-h>', builtin.help_tags, {})
vim.keymap.set('n', 'gr', find_references, {})
