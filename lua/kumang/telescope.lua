local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope Find git Files" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope Find grep Files" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope Find diagnostics Files" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope Find keymap Files" })
vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope Find existing buffers" })
