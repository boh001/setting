return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Header                                                  │
    -- ╰──────────────────────────────────────────────────────────╯
    local header = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
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
    local thingy = io.popen(
      'echo "$(LANG=en_us_88591; date +%a) $(date +%d) $(LANG=en_us_88591; date +%b)" | tr -d "\n"'
    )
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
        { type = "padding", val = 1 },
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
