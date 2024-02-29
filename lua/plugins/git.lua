return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require("gitsigns")

      gs.setup({})

      vim.keymap.set("n", "<leader>gD", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("v", "<leader>gdr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
    end,
  },
}
