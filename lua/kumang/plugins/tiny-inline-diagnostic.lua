return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			transparent_bg = true,
			options = {
				display_count = true,
				multilines = {
					enabled = true,
				},
			},
		})
	end,
}
