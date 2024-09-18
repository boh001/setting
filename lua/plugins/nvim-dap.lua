return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
    })

    local dap = require("dap")
    dap.adapters.codelldb = {
      type = "server",
      port = "1300",
      executable = {
        -- CHANGE THIS to your path!
        command = "/usr/bin/lldb",
        args = { "--port", "1300" },

        -- On windows you may have to uncomment this:
        -- detached = false,
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.rust

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<F1>", function()
      dap.continue()
    end)
    vim.keymap.set("n", "<F2>", function()
      dap.step_over()
    end)
    vim.keymap.set("n", "<F3>", function()
      dap.step_into()
    end)
    vim.keymap.set("n", "<F4>", function()
      dap.step_out()
    end)
    vim.keymap.set("n", "<Leader>b", function()
      dap.toggle_breakpoint()
    end)
  end,
}
