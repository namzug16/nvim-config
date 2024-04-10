return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem toggle<CR>", {})
		local neotree = require("neo-tree")
		neotree.setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            "node_modules",
          },
          hide_by_pattern = {
            "*_templ.go"
          },
        },
      },
		})
	end,
}
