local chatgpt = require("chatgpt")
local home = vim.fn.expand("$HOME")
chatgpt.setup({
	api_key_cmd = "cat " .. home .. "/openai_api_key.txt.gpg",
})
