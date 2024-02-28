return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require "mason".setup({
        ensure_installed = {
          -- lua
          "lua_ls",
          "stylua",

          -- js/ts
          "tsserver",
          "denols",

          -- golang
          "gopls",
          "goimports",
          "gofumpt",
          "gomodifytags",
          "impl",
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require "mason-lspconfig".setup({
        auto_install = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- keymaps
      vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>cf', function()
        vim.lsp.buf.format { async = true }
      end, {})

      local lsp = require "lspconfig"

      local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

      lsp.lua_ls.setup({
        capabilities = capabilities,
      })


      lsp.tsserver.setup {
        capabilities = capabilities,
        root_dir = lsp.util.root_pattern("package.json"),
        single_file_support = false
      }

      lsp.denols.setup {
        capabilities = capabilities,
        root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
      }

      lsp.gopls.setup({
        capabilities = capabilities,
        keys = {
          { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
        },
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      })
    end
  }
}
