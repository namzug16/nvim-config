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

          -- zig
          "zls",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
      })
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
      vim.keymap.set("n", "<leader>cr", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.filetype.add({ extension = { templ = "templ" } })

      local builtin = require('telescope.builtin')

      -- keymaps
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      local lsp = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lsp.lua_ls.setup({
        capabilities = capabilities,
      })

      lsp.bashls.setup({
        capabilities = capabilities,
      })

      lsp.ltex.setup({
        capabilities = capabilities,
      })

      lsp.templ.setup({
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr, remap = false }
          local templ_format = function()
            local filename = vim.api.nvim_buf_get_name(bufnr)
            local cmd = "templ fmt " .. vim.fn.shellescape(filename)

            vim.fn.jobstart(cmd, {
              on_exit = function()
                -- Reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                  vim.cmd("e!")
                end
              end,
            })
          end
          vim.keymap.set("n", "<leader>cf", templ_format, opts)
        end,
        capabilities = capabilities,
        filetypes = { "templ" },
      })

      lsp.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      lsp.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "javascript", "typescript" },
      })

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

      local dartExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("/opt/homebrew/"),
        vim.fn.expand("$HOME/tools/flutter/"),
      }

      lsp.dartls.setup({
        capabilities = capabilities,
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        root_markers = { "pubspec.yaml" },
        init_options = {
          onlyAnalyzeProjectsWithOpenFiles = false,
          suggestFromUnimportedLibraries = true,
          closingLabels = true,
          outline = false,
          flutterOutline = false,
        },
        settings = {
          dart = {
            analysisExcludedFolders = dartExcludedFolders,
            enableSdkFormatter = true,
            updateImportsOnRename = true,
            completeFunctionCalls = true,
            showTodos = false,
          },
        },
      })

      lsp.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })

      lsp.zls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
