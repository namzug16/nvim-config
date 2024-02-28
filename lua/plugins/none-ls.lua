return {
  "nvimtools/none-ls.nvim",
  optional = true,
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    local nls = require("null-ls")
    nls.setup({
      sources = {
        -- lua
        nls.builtins.formatting.stylua,
        -- golang
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      }
    })
  end
}
