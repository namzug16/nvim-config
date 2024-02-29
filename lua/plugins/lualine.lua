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
          normal = { c = { fg = colors.green, bg = "NONE" } },
          inactive = { c = { fg = colors.black, bg = colors.green } },
        },
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
        return "0"
      end,
      color = { fg = colors.green, bg = "NONE" },
      padding = { left = 0, right = 1 },
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.green, bg = "NONE", gui = "bold" },
    })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      color = { fg = colors.green, bg = "NONE", gui = "bold" },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
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
      color = { fg = colors.green, bg = "NONE", gui = "bold" },
    })

    ins_right({
      "branch",
      icon = "",
      color = { gui = "bold" },
    })

    ins_right({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = "󰝤 ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_right({
      "location",
      color = { fg = colors.green, bg = "NONE" },
    })

    ins_right({
      function()
        return "1"
      end,
      color = { fg = colors.green },
      padding = { left = 1 },
    })

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
