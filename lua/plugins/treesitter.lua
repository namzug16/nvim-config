return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_intalled = {
        -- golang
        "go",
        "gomod",
        "gowork",
        "gosum",
        "templ",
        "nvim-ts-autotag",

      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
