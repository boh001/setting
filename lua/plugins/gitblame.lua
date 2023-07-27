-- Lua 파일에서 g:gitblame_message_template 설정하기
vim.api.nvim_set_var('gitblame_message_template', '<committer>, <sha> (<committer-date>)')
vim.api.nvim_set_var('gitblame_date_format', '%r')


