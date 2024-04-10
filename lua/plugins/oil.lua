return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    local oil = require("oil")
    oil.setup({
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, _)
          return name:match("*_templ.go")
        end,
      }
    })
  end,
}
