return {
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "<leader>cc",
			},
			opleader = {
				line = "<leader>cc",
			},
			extra = {},
			mappings = {
				basic = true,
				extra = false,
			},
			pre_hook = nil,
			post_hook = nil,
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
    config = function()
      require("todo-comments").setup({})
    end,
	},
}
