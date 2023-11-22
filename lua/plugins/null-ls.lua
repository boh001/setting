local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.asmfmt,
		null_ls.builtins.diagnostics.cmake_lint,
		null_ls.builtins.formatting.cmake_format,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
})
