require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}
vim.api.nvim_set_var('gitblame_message_template', '<committer>, <sha> (<committer-date>)')
vim.api.nvim_set_var('gitblame_date_format', '%r')


