return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    -- 16color colors
    local colors = {
      black = "#000000",
      maroon = "#800000",
      green = "#00FF00",
      olive = "#808000",
      navy = "#000080",
      purple = "#800080",
      teal = "#008080",
      silver = "#c0c0c0",
      gray = "#808080",
      red = "#ff0000",
      lime = "#00ff00",
      yellow = "#ffff00",
      blue = "#0000ff",
      fuchsia = "#ff00ff",
      aqua = "#00ffff",
      white = "#ffffff",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.black, bg = colors.green } },
          inactive = { c = { fg = colors.black, bg = colors.green } },
        },
        globalstatus = true,
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {
          {
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.black, bg = colors.green },
            padding = { left = 2, right = 1 },
          },
        },
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      function()
        return "000"
      end,
      padding = { left = 1, right = 0 },
      color = { gui = "bold" },
    })

    ins_left({
      "mode",
      cond = conditions.buffer_not_empty,
      color = { gui = "bold" },
    })

    ins_left({
      function()
        return "000"
      end,
      cond = conditions.buffer_not_empty,
      padding = { left = 0, right = 1 },
      color = { gui = "bold" },
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { gui = "bold" },
    })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        error = { fg = colors.black, bg = colors.green },
        warn = { fg = colors.black, bg = colors.green },
        info = { fg = colors.black, bg = colors.green },
        hint = { fg = colors.black, bg = colors.green },
      },
    })

    ins_right({
      function()
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return ""
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return ""
      end,
      color = { gui = "bold" },
    })

    ins_right({
      "branch",
      icon = " ",
      color = { gui = "bold" },
    })

    ins_right({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = "󰝤 ", removed = " " },
      diff_color = {
        added = { fg = colors.black, bg = colors.green },
        modified = { fg = colors.black, bg = colors.green },
        removed = { fg = colors.black, bg = colors.green },
      },
      cond = conditions.hide_in_width,
    })

    ins_right({
      "location",
    })

    ins_right({
      function()
        return "000"
      end,
      padding = { left = 1, right = 1 },
      color = { gui = "bold" },
    })

    lualine.setup(config)
  end,
}
