return {
	"smoka7/multicursors.nvim",
	event = "VeryLazy",
	dependencies = {
		"smoka7/hydra.nvim",
	},
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  config = function()
    require("multicursors").setup({})
  end
}
