return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  config = function()
    local trouble = require("trouble")

    trouble.setup({
      position = "bottom", -- position of the list can be: bottom, top, left, right height = 10,                   -- height of the trouble list when position is top or bottom width = 50,                    -- width of the list when position is left or right
      mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q",                     -- close the list
        cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",                   -- manually refresh
        jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },        -- open buffer in new split
        open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
        open_tab = { "<c-t>" },          -- open buffer in new tab
        jump_close = { "o" },            -- jump to the diagnostic and close the list
        toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
        hover = "K",                     -- opens a small popup with the full multiline message
        preview = "p",                   -- preview the diagnostic location
        open_code_href = "c",            -- if present, open a URI with more information about the diagnostic error
        close_folds = { "zM", "zm" },    -- close all folds
        open_folds = { "zR", "zr" },     -- open all folds
        toggle_fold = { "zA", "za" },    -- toggle fold of current file
        previous = { "k", "<c-n>" },     -- previous item
        next = { "j", "<C-n>" }          -- next item
      },
      indent_lines = true,               -- add an indent guide below the fold icons
      auto_open = false,                 -- automatically open the list when you have diagnostics
      auto_close = true,                 -- automatically close the list when you have no diagnostics
      auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false,                 -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      --[[ signs = {
        error       = icons.error,
        warning     = icons.warningTriangle,
        hint        = icons.light,
        information = icons.info,
      }, ]]
      use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
    })

    vim.keymap.set("n", "<leader>d", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
    vim.keymap.set("n", "<leader>dd", "<cmd>Trouble diagnostics toggle<CR>")
  end,
}
