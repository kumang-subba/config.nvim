return {
	"rmagatti/alternate-toggler",
	config = function()
		require("alternate-toggler").setup({
			alternates = {
				["=="] = "!=",
			},
		})
		vim.keymap.set(
			"n",
			"<C-f>",
			"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
			{ desc = "Flip values" }
		)
	end,
}
