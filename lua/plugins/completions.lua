return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      local cmp = require 'cmp'

      require "luasnip.loaders.from_vscode".lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            require 'luasnip'.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          -- { name = 'nvim_lsp' },
          -- { name = 'vsnip' },
          { name = 'luasnip' },
          -- { name = 'ultisnips' },
          -- { name = 'snippy' },
        }, {
          { name = 'buffer' },
        })
      })

      local lspconfig = require "lspconfig"

      local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

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
