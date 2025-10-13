return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.pairs").setup()
			require("mini.indentscope").setup({
				symbol = "│",
			})
		end,
	},
}
