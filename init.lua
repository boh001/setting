--[[

Neovim init file
Maintainer: brainf+ck

--]]

-- Import Lua modules
-- config
require('config.options')
require('config.colorscheme')
require('config.keymap')
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
