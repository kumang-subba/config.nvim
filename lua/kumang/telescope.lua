local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				[vim.g.keyboard_format and "<C-n>" or "<C-j>"] = actions.move_selection_next,
				[vim.g.keyboard_format and "<C-e>" or "<C-k>"] = actions.move_selection_previous,
			},
			i = {
				[vim.g.keyboard_format and "<C-n>" or "<C-j>"] = actions.move_selection_next,
				[vim.g.keyboard_format and "<C-e>" or "<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fgf", builtin.git_files, { desc = "Telescope Find git Files" })
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Telescope Find git Files" })
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "Telescope Find git Files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope Find Word" })
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Telescope Find Word under Cursor" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope Find diagnostics Files" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope Find keymap Files" })
vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fb>", builtin.buffers, { desc = "Telescope Find existing buffers" })
