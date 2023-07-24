local keymap = vim.keymap.set
local silent = { silent = true }

local get_char_before_cursor = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line_content = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    local char_at_cursor = string.sub(line_content, col, col)
    return char_at_cursor
end

local get_char_after_cursor = function ()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    col = col + 1
    local line_content = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    local char_after_cursor = string.sub(line_content, col, col)
    return char_after_cursor
end

-- bracket and quote
keymap("i", "{", "{}<Esc>ha", silent)
keymap("i", "[", "[]<Esc>ha", silent)
keymap("i", "(", "()<Esc>ha", silent)

function is_bracket(input)
  return input == "{}" or input == "[]" or input == "()"
end

function is_quote(input)
  return input == '""' or input == "''" or input == "``"
end

local indent_in_bracket = function ()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line_content = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
  local content = string.sub(line_content, col, col + 1)

  if is_bracket(content) then
    return "<CR><Esc>ko<Esc><S-i><Tab>"
  else
    return "<CR>"
  end
end

local jump_bracket_to_next = function(input)
  return function ()
    local char_after_cursor = get_char_after_cursor()

    if char_after_cursor == input then
      return "<Esc>la" 
    else 
      return input
    end
  end
end

local jump_quote_to_next = function(input)
  return function ()
    local char_after_cursor = get_char_after_cursor()

    if char_after_cursor == input then
      return "<Esc>la" 
    else 
      return input .. input .. "<Esc>ha"
    end
  end
end

keymap("i", "<CR>", indent_in_bracket, { silent = true, expr = true })
keymap("i", "}", jump_bracket_to_next("}"), { silent = true, expr = true })
keymap("i", ")", jump_bracket_to_next(")"), { silent = true, expr = true })
keymap("i", "]", jump_bracket_to_next("]"), { silent = true, expr = true })
keymap("i", '"', jump_quote_to_next('"'), { silent = true, expr = true })
keymap("i", "'", jump_quote_to_next("'"), { silent = true, expr = true })
keymap("i", "`", jump_quote_to_next("`"), { silent = true, expr = true })


