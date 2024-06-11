return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  keys = {
    {
      "<leader>q",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      desc = "CopilotChat - Quick chat",
    },
  },
  opts = {
    debug = true,
  },
  -- See Commands section for default commands if you want to lazy load on them
  config = function()
    require("CopilotChat").setup({})
    require("CopilotChat.integrations.cmp").setup({})
  end,
}
