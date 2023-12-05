local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

local lspconfig = require("lspconfig")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", ",a", ":CodeActionMenu<CR>", opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

local function on_attach(client, bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.marksman.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.terraformls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.dockerls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.docker_compose_language_service.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.prismals.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- Diagnostic config

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.diagnostic.config({
	update_in_insert = true,
})

local codes = {
	-- Lua
	no_matching_function = {
		message = " Can't find a matching function",
		"redundant-parameter",
		"ovl_no_viable_function_in_call",
	},
	empty_block = {
		message = " That shouldn't be empty here",
		"empty-block",
	},
	missing_symbol = {
		message = " Here should be a symbol",
		"miss-symbol",
	},
	expected_semi_colon = {
		message = " Please put the `;` or `,`",
		"expected_semi_declaration",
		"miss-sep-in-table",
		"invalid_token_after_toplevel_declarator",
	},
	redefinition = {
		message = " That variable was defined before",
		icon = " ",
		"redefinition",
		"redefined-local",
		"no-duplicate-imports",
		"@typescript-eslint/no-redeclare",
		"import/no-duplicates",
	},
	no_matching_variable = {
		message = " Can't find that variable",
		"undefined-global",
		"reportUndefinedVariable",
	},
	trailing_whitespace = {
		message = "  Whitespaces are useless",
		"trailing-whitespace",
		"trailing-space",
	},
	unused_variable = {
		message = "  Don't define variables you don't use",
		icon = "  ",
		"unused-local",
		"@typescript-eslint/no-unused-vars",
		"no-unused-vars",
	},
	unused_function = {
		message = "  Don't define functions you don't use",
		"unused-function",
	},
	useless_symbols = {
		message = " Remove that useless symbols",
		"unknown-symbol",
	},
	wrong_type = {
		message = " Try to use the correct types",
		"init_conversion_failed",
	},
	undeclared_variable = {
		message = " Have you delcared that variable somewhere?",
		"undeclared_var_use",
	},
	lowercase_global = {
		message = " Should that be a global? (if so make it uppercase)",
		"lowercase-global",
	},
	-- Typescript
	no_console = {
		icon = "  ",
		"no-console",
	},
	-- Prettier
	prettier = {
		icon = "  ",
		"prettier/prettier",
	},
}

vim.diagnostic.config({
	severity_sort = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	virtual_text = false,
	float = {
		source = false,
		format = function(diagnostic)
			local code = diagnostic and diagnostic.user_data and diagnostic.user_data.lsp.code

			if not diagnostic.source or not code then
				return string.format("%s", diagnostic.message)
			end

			if diagnostic.source == "eslint" then
				for _, table in pairs(codes) do
					if vim.tbl_contains(table, code) then
						return string.format("%s [%s]", table.icon .. diagnostic.message, code)
					end
				end

				return string.format("%s [%s]", diagnostic.message, code)
			end

			for _, table in pairs(codes) do
				if vim.tbl_contains(table, code) then
					return table.message
				end
			end

			return string.format("%s [%s]", diagnostic.message, diagnostic.source)
		end,
	},
})

-- UI

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.cmd([[
 highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl guifg=#db4b4b
 highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guifg=#e0af68
 highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl guifg=#0db9d7
 highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl guifg=#1abc9c
 highlight DiagnosticUnderlineOk cterm=underline gui=underline guifg=LightGreen
]])

vim.o.updatetime = 500
