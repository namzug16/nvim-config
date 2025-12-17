return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>", {})
    vim.keymap.set("n", "<leader>fm", builtin.git_status, {
      desc = "Find git changed files",
    })

    vim.api.nvim_create_user_command('SS', function(opts)
      builtin.lsp_document_symbols({ query = opts.args })
    end, { nargs = '?' })

    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
  end,
}
