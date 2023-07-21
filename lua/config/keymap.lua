local keymap = vim.keymap.set
local silent = { silent = true }

-- bracket
keymap("i", "{", "{}<Esc>ha", slient)
keymap("i", "[", "[]<Esc>ha", slient)
keymap("i", "(", "()<Esc>ha", slient)

function indent_in_brackets()
  local start_pos = vim.fn.searchpairpos('{', '', '}', 'n')
  if start_pos[1] > 0 and start_pos[2] > 0 then
    return '<CR><Esc>`]'
  else
    return '<CR>'
  end
end

keymap("i", '<CR>', 'v:lua.indent_in_brackets()', { silent = true, expr = true })

