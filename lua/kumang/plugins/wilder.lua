return {
	"gelguy/wilder.nvim",
	config = function()
		local wilder = require("wilder")
		local next_key
		local previous_key
		if vim.g.keyboard_format == "colemak_dhm" then
			next_key = "<C-n>"
			previous_key = "<C-e>"
		else
			next_key = "<C-down>"
			previous_key = "<C-up>"
		end
		wilder.setup({
			modes = { ":", "/", "?" },
			next_key = next_key,
			previous_key = previous_key,
		})

		local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
			border = "rounded",
			max_height = "70%",
			min_height = 0,
			prompt_position = "top",
			reverse = 0,
			max_width = "30%",
			left = {
				" ",
				wilder.popupmenu_devicons(),
			},
			right = {
				" ",
				wilder.popupmenu_scrollbar(),
			},
		}))

		wilder.set_option(
			"renderer",
			wilder.renderer_mux({
				[":"] = popupmenu_renderer,
				["/"] = wilder.wildmenu_renderer(),
			})
		)
	end,
}
