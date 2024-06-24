return {
	"ggandor/leap.nvim",
	name = "leap",
	dependencies = { "tpope/vim-repeat" },
	init = function()
		require("leap").create_default_mappings()
	end,
}
