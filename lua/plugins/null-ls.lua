local null_ls = require("null-ls")

local shellcheck = null_ls.builtins.code_actions.shellcheck

local sources = {
  shellcheck,
}

null_ls.setup({
  sources = sources,
})
