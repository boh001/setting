return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<C-o>", api.node.open.tab, opts("Open: New Tab"))
      vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "<C-t>", api.tree.toggle, opts("Close"))
      vim.keymap.set("n", "<Esc>", api.tree.close, opts("Close"))
      vim.keymap.set("n", "<C-r>", api.tree.reload, opts("Refresh"))
      vim.keymap.set("n", "a", api.fs.create, opts("Create"))
      vim.keymap.set("n", "d", api.fs.trash, opts("Delete"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      -- project.nvim
      trash = {
        cmd = "trash-put",
      },
      view = {
        width = 50,
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filters = {
        git_ignored = false,
        dotfiles = false,
      },

      git = {
        enable = false,
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = { "node_modules" },
      },
    })

    vim.keymap.set(
      "n",
      "<C-t>",
      "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>",
      { noremap = true, silent = true }
    )

    vim.keymap.set(
      "n",
      "<C-h>",
      "<cmd>lua require('nvim-tree.api').tree.focus()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
