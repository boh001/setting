--Neovim init file

-- config
require('config.keymappings')
require('config.options')
require('config.colorscheme')
require('config.lazy')

-- plugins
require('plugins.alpha')
require('plugins.nvim-tree')
require('plugins.lsp')
require('plugins.mason')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.bufferline')
require('plugins.workspaces')
require('plugins.glow')
require('plugins.null-ls')
require('plugins.osc52')
require('plugins.toggleterm')
require('plugins.colorizer')
require('plugins.trouble')
require('plugins.gitblame')
require('plugins.treesitter')
require('plugins.autosession')
