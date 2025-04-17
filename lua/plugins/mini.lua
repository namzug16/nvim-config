return {
	{
		"echasnovski/mini.surround",
		lazy = false,
		version = "*",
		config = function()
			require("mini.surround").setup({})
		end,
	},
	{
		"echasnovski/mini.pairs",
		lazy = false,
		config = function()
			require("mini.pairs").setup({})
		end,
	},
}
