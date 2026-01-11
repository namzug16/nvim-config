return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ensure_installed = {
          -- lua
          "lua-language-server",
          "stylua",

          -- bash
          "bashls",
          "shellcheck",

          -- markdown
          "ltex-lsp",

          -- web
          "html-lsp",

          -- "tailwindcss",
          "tailwindcss-language-server",

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
          "postgres-language-server",

          --typos
          "typos_lsp",

          --python
          "python-lsp-server",
        },
      })
    end,
  },
}
