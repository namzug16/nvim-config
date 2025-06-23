return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ensure_installed = {
          -- lua
          "lua_ls",
          "stylua",

          -- bash
          "bashls",
          "shellcheck",

          -- markdown
          "ltex",

          -- web
          "html",

          -- "tailwindcss",

          -- js/ts
          "typescript-language-server",
          "prettier",

          -- golang
          "gopls",
          "goimports",
          "gofumpt",
          "gomodifytags",
          "impl",

          --sql
          "sqlls",

        },
      })
    end,
  },
}
