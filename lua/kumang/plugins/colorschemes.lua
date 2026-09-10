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
			styles = {
				functions = { "bold", "italic" },
				-- variables = { "bold" },
				comments = { "underline", "italic" },
				keywords = { "italic" },
				types = { "italic" },
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
				telescope = { enabled = true },
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
				indent_blankline = {
					enabled = true,
					scope_color = "sapphire",
					colored_indent_levels = true,
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
