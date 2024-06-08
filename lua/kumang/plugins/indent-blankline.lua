return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local indent = "passive"

		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "passive", { fg = "#686996" })
		end)
		require("ibl").setup({
			indent = { highlight = indent },
		})
	end,
}
