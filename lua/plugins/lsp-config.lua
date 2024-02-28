return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require "mason".setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require "mason-lspconfig".setup({
        ensure_installed = { "lua_ls", "gopls", "tsserver", "denols" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>cf', function()
        vim.lsp.buf.format { async = true }
      end, {})
    end
  }
}
