local s = "╎"
return {
  {
    "echasnovski/mini.indentscope",
    config = function()
      local indent = require("mini.indentscope")
      indent.setup({
        symbol = s,
        options = { try_as_border = true },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = s,
        tab_char = s,
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },
}
