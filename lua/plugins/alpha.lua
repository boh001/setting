return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Headder                                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    local header = {
      "██╗  ██╗  ███████╗  ██╗       ██╗        ██████╗ ",
      "██║  ██║  ██╔════╝  ██║       ██║       ██╔═══██╗",
      "███████║  █████╗    ██║       ██║       ██║   ██║",
      "██╔══██║  ██╔══╝    ██║       ██║       ██║   ██║",
      "██║  ██║  ███████╗  ███████╗  ███████╗  ╚██████╔╝",
      "╚═╝  ╚═╝  ╚══════╝  ╚══════╝  ╚══════╝   ╚═════╝ ",
    }
    dashboard.section.header.type = "text"
    dashboard.section.header.val = header
    dashboard.section.header.opts = {
      position = "center",
      hl = "Header",
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Section                                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    local thingy =
        io.popen('echo "$(LANG=en_us_88591; date +%a) $(date +%d) $(LANG=en_us_88591; date +%b)" | tr -d "\n"')
    if thingy == nil then
      return
    end
    local date = thingy:read("*a")
    thingy:close()

    local datetime = os.date(" %H:%M")

    local top_section = {
      type = "text",
      val = "┌────────────   Today is "
          .. date
          .. " ────────────┐",
      opts = {
        position = "center",
        hl = "HeaderInfo",
      },
    }

    local middle_section = {
      type = "text",
      val = "│                                                │",
      opts = {
        position = "center",
        hl = "HeaderInfo",
      },
    }

    local bottom_section = {
      type = "text",
      val = "└───══───══───══───  "
          .. datetime
          .. "  ───══───══───══────┘",
      opts = {
        position = "center",
        hl = "HeaderInfo",
      },
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Button                                                   │
    -- ╰──────────────────────────────────────────────────────────╯
    local icons = require("config.icons")

    local leader = ","

    --- @param sc string
    --- @param txt string
    --- @param keybind string optional
    --- @param keybind_opts table optional
    local function button(sc, txt, keybind, keybind_opts)
      local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

      local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "EcovimPrimary",
      }
      if keybind then
        keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
      end

      local function on_press()
        -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
      end

      return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
      }
    end

    dashboard.section.buttons.val = {
      button("<C-o>", icons.fileNoBg .. " " .. "Find Project", "<cmd>Telescope workspaces<CR>", {}),
      button("<C-]>", icons.fileNoBg .. " " .. "Find File", "<cmd>Telescope find_files hidden=true<CR>", {}),
      button("<leader>l", icons.container .. " " .. "Manage Plugins", "<cmd>Lazy<CR>", {}),
      button("<leader>n", icons.cog .. " " .. "Settings", "<cmd>e $MYVIMRC<CR>", {}),
      button("-", icons.exit .. " " .. "Exit", "<cmd>exit<CR>", {}),
    }


    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Footer                                                   │
    -- ╰──────────────────────────────────────────────────────────╯
    local function footer()
      local v = vim.version()
      return string.format(" v%d.%d.%d", v.major, v.minor, v.patch)
    end

    dashboard.section.footer.val = {
      footer(),
    }
    dashboard.section.footer.opts = {
      position = "center",
      hl = "EcovimFooter",
    }

    require("alpha").setup({
      layout = {
        { type = "padding", val = 10 },
        dashboard.section.header,
        { type = "padding", val = 1 },
        top_section,
        middle_section,
        bottom_section,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 3 },
        dashboard.section.footer,
      },
      opts = {
        margin = 5,
      },
    })

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Hide tabline and statusline on startup screen            │
    -- ╰──────────────────────────────────────────────────────────╯
    vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = "alpha_tabline",
      pattern = "alpha",
      command = "set showtabline=0 laststatus=0 noruler",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "alpha_tabline",
      pattern = "alpha",
      callback = function()
        vim.api.nvim_create_autocmd("BufUnload", {
          group = "alpha_tabline",
          buffer = 0,
          command = "set showtabline=2 ruler laststatus=3",
        })
      end,
    })
  end,
}
