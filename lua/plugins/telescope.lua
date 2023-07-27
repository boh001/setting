local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.load_extension("workspaces")
telescope.load_extension("session-lens")

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
      i = { ["<c-y>"] = trouble.open_with_trouble },
      n = { ["<c-y>"] = trouble.open_with_trouble },
    }
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

vim.keymap.set('n', '<C-`>', find_files, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-o>', "<cmd>Telescope workspaces<CR>", {})
vim.keymap.set('n', '<C-=>', "<cmd>Telescope oldfiles hidden=true<CR>", {})
vim.keymap.set('n', '<C-s>', "<cmd>Telescope session-lens search_session<CR>", {})
vim.keymap.set('n', '<C-S-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-f-h>', builtin.help_tags, {})
vim.keymap.set('n', 'gr', find_references, {})
