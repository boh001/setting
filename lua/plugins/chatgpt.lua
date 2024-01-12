local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
	api_key_cmd = "cat " .. home .. "/openai_api_key.txt",
	openai_params = {
		model = "gpt-4",
	},
	openai_edit_params = {
		model = "gpt-4",
	},
})
