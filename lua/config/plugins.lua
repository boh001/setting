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
		},
	},
	"williamboman/mason.nvim",
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	"jose-elias-alvarez/null-ls.nvim",
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
		},
	},
	"pocco81/auto-save.nvim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"ellisonleao/glow.nvim",
	{
		"natecraddock/workspaces.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	{ "echasnovski/mini.nvim", version = "*" },
	"ojroques/nvim-osc52",
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	"norcalli/nvim-colorizer.lua",
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"f-person/git-blame.nvim",
	"nvim-treesitter/nvim-treesitter",
	"jiangmiao/auto-pairs",
	"windwp/nvim-ts-autotag",
	"lukas-reineke/indent-blankline.nvim",
	"yamatsum/nvim-cursorline",
	"mg979/vim-visual-multi",
	"numToStr/Comment.nvim",
	"neovim/nvim-lspconfig",
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	},
	"mhartington/formatter.nvim",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
}
