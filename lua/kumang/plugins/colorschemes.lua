return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	init = function()
		require("catppuccin").setup({
			term_colors = true,
			transparent_background = true,
			styles = {
				functions = { "italic" },
				comments = { "underline", "italic" },
				keywords = { "italic", "bold" },
				types = { "italic" },
				strings = { "italic" },
			},
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "underline" },
					warnings = { "underdotted" },
					information = { "underline" },
				},
			},
			integrations = {
				cmp = true,
				nvimtree = true,
				leap = true,
				treesitter = true,
				telescope = true,
				harpoon = true,
				notify = true,
				neotest = true,
				noice = true,
				which_key = true,
				fidget = true,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
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
			},
			flavour = "mocha",
			highlight_overrides = {
				mocha = function(mocha)
					return {
						LineNr = { fg = mocha.flamingo },
						Whitespace = { fg = mocha.lavender },
					}
				end,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
