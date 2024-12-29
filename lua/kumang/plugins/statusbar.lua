return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
	config = function()
		require("nvim-navic").setup({
			lsp = {
				auto_attach = true,
			},
			icons = {
				File = " ",
				Module = " ",
				Namespace = " ",
				Package = " ",
				Class = " ",
				Method = " ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = " ",
				Interface = " ",
				Function = " ",
				Variable = " ",
				Constant = " ",
				String = " ",
				Number = " ",
				Boolean = " ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = " ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		})
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						icon = " ",
						separator = nil,
						cond = nil,
						draw_empty = false,
						color = nil,
						type = nil,
						fmt = nil,
						on_click = nil,
					},
				},
				lualine_c = {
					{
						"navic",
						color_correction = nil,
						navic_opts = nil,
					},
				},
			},
		})
	end,
}
