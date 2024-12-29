return {
	"karb94/neoscroll.nvim",
	opts = {},
	config = function()
		local neoscroll = require("neoscroll")
		local keymap
		if vim.g.keyboard_format == "colemak_dhm" then
			keymap = {
				["E"] = function()
					neoscroll.ctrl_u({ duration = 50 })
				end,
				["N"] = function()
					neoscroll.ctrl_d({ duration = 50 })
				end,
				["zz"] = function()
					neoscroll.zz({ half_win_duration = 100 })
				end,
			}
		else
			keymap = {
				["<S-up>"] = function()
					neoscroll.ctrl_u({ duration = 50 })
				end,
				["<S-down>"] = function()
					neoscroll.ctrl_d({ duration = 50 })
				end,
				["zz"] = function()
					neoscroll.zz({ half_win_duration = 100 })
				end,
			}
		end
		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
