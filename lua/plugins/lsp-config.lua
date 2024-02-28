return {
  {
    "williamboman/mason.nvim",
    config = function()
      require "mason".setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "mason-lspconfig".setup({
        ensure_installed = { "lua_ls", "gopls", "tsserver", "denols" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"

      vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>cf', function()
        vim.lsp.buf.format { async = true }
      end, {})

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      lspconfig.denols.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package.json"),
        single_file_support = false
      }
    end
  }
}
