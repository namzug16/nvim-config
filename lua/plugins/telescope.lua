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
		vim.keymap.set("n", "<leader>bb", builtin.buffers, {})

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
