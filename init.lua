if vim.fn.has("nvim-0.9") == 0 then
	vim.api.nvim_echo({
		{ "Requires Neovim >= 0.9.0\n", "ErrorMsg" },
		{ "Press any key to exit", "MoreMsg" },
	}, true, {})
	vim.fn.getchar()
	vim.cmd.quit()
end

-- config
require("config.keymaps")
require("config.options")
require("config.lazy")
