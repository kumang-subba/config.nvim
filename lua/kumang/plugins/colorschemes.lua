return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- "folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		require("catppuccin").setup({
			term_colors = true,
			transparent_background = true,
			integrations = {
				cmp = true,
				nvimtree = true,
				harpoon = true,
				notify = true,
				neotest = true,
				noice = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				indent_blankline = {
					enabled = true,
					scope_color = "lavender",
				},
			},
			flavour = "mocha",
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
