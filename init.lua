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
require('plugins.nvim-tree')
