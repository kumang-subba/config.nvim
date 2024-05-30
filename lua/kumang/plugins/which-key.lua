return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key")
		-- Document existing key chains
		require("which-key").register({
			["<leader>f"] = { name = "Find", _ = "which_key_ignore" },
			["<leader>t"] = { name = "Test", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Git Hunk", _ = "which_key_ignore" },
			["<leader>b"] = { name = "Debug and Buffers", _ = "which_key_ignore" },
			["<leader>l"] = { name = "Live server", _ = "which_key_ignore" },
		})
		-- visual mode
		require("which-key").register({
			["<leader>h"] = { "Git Hunk" },
		}, { mode = "v" })
	end,
}
