return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
	    "nvim-tree/nvim-web-devicons",
    }
  },
  "williamboman/mason.nvim",
  {
    "neovim/nvim-lspconfig",
    lazy = false,
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
  },
  "williamboman/mason-lspconfig.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
			{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
     }
  },
  "pocco81/auto-save.nvim",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
	    "nvim-tree/nvim-web-devicons",
    }
  },
  {
    'akinsho/bufferline.nvim', 
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
      end
  },
  "terryma/vim-multiple-cursors",
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  "ellisonleao/glow.nvim",
  {
    "natecraddock/workspaces.nvim",
    dependencies = {
      'nvim-telescope/telescope.nvim',
    }
  }
}
