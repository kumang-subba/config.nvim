return {
	"3rd/diagram.nvim",
	dependencies = {
		{ "3rd/image.nvim" },
	},
	config = function()
		require("diagram").setup({
			events = {
				render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
				clear_buffer = { "BufLeave" },
			},
			renderer_options = {
				mermaid = {
					background = "transparent",
					theme = "dark",
				},
			},
		})
	end,
}
