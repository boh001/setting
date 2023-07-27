require("auto-session").setup({
  auto_session_suppress_dirs = {"~/projects/", "~/.config/"},
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = false,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'NvimTree', 'Trouble' },
  callback = function(args)
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        vim.api.nvim_buf_delete(args.buf, { force = true })
        return true
      end
    })
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local view = require('nvim-tree.view')
    local is_visible = view.is_visible()

    local api = require('nvim-tree.api')
    if not is_visible then
      api.tree.open()
    end
  end,
})
