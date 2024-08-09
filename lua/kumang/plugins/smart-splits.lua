return {
	"mrjones2014/smart-splits.nvim",
	build = "./kitty/install-kittens.bash",
	config = function()
		require("smart-splits").setup({
			ignored_buftypes = {
				"nofile",
				"quickfix",
				"prompt",
			},
			ignored_filetypes = { "NvimTree" },
			default_amount = 3,
			at_edge = "wrap",
			float_win_behavior = "previous",
			move_cursor_same_row = false,
			cursor_follows_swapped_bufs = false,
			resize_mode = {
				quit_key = "<ESC>",
				resize_keys = { "h", "j", "k", "l" },
				silent = false,
				hooks = {
					on_enter = nil,
					on_leave = nil,
				},
			},
			ignored_events = {
				"BufEnter",
				"WinEnter",
			},
			disable_multiplexer_nav_when_zoomed = true,
			kitty_password = nil,
			log_level = "info",
		})
		vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize left" })
		vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize down" })
		vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize up" })
		vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize right" })
		-- moving between splits
		vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move cursor left" })
		vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move cursor down" })
		vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move cursor up" })
		vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move cursor right" })
		vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous, { desc = "Move cursor previous" })
		-- swapping buffers between windows
		vim.keymap.set(
			"n",
			"<leader><leader>h",
			require("smart-splits").swap_buf_left,
			{ desc = "Swap buffer with left" }
		)
		vim.keymap.set(
			"n",
			"<leader><leader>j",
			require("smart-splits").swap_buf_down,
			{ desc = "Swap buffer with down" }
		)
		vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap buffer with up" })
		vim.keymap.set(
			"n",
			"<leader><leader>l",
			require("smart-splits").swap_buf_right,
			{ desc = "Swap buffer with right" }
		)
	end,
}
