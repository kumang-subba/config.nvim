return {
	"gelguy/wilder.nvim",
	config = function()
		local wilder = require("wilder")
		wilder.setup({
			modes = { ":", "/", "?" },
			next_key = "<C-j>",
			previous_key = "<C-k>",
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
