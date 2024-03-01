return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jonarrien/telescope-cmdline.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>bb", builtin.buffers, {})

		local telescope = require("telescope")
		telescope.setup({
			extensioions = {
				cmdline = {
					picker = {
						layout_config = {
							width = 120,
							height = 25,
						},
					},
				},
			},
		})
		telescope.load_extension("cmdline")

		vim.api.nvim_set_keymap("n", ":", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
		vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
	end,
}
