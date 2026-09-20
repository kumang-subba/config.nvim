local actions = require("telescope.actions")
local themes = require("telescope.themes")

require("telescope").setup({
	defaults = vim.tbl_extend("force", themes.get_ivy(), {
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
		preview = {
			treesitter = false,
		},
		layout_config = { height = 0.5 },
	}),
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = " Telescope Find Files" })
vim.keymap.set("n", "<leader>fgf", builtin.git_files, { desc = " Telescope Find git Files" })
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = " Telescope Find git commits" })
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = " Telescope Find git branches" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = " Telescope Find help tags" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = " Telescope Find Word" })
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = " Telescope Find Word under Cursor" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = " Telescope Find keymap Files" })
vim.keymap.set("n", "<leader>fm", function()
	builtin.man_pages({ sections = { "ALL" } })
end, { desc = " Telescope man pages" })

vim.keymap.set("n", "gs", builtin.lsp_document_symbols, { desc = " Telescope current document symbols" })
vim.keymap.set("n", "gD", builtin.diagnostics, { desc = " Telescope Find diagnostics Files" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = " Telescope list LSP references", nowait = true })
vim.keymap.set("n", "gi", builtin.lsp_implementations, {
	desc = " Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope",
})
vim.keymap.set("n", "gd", builtin.lsp_definitions, {
	desc = " Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
})

vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = " Telescope find files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = " Telescope Find existing buffers" })
vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = " Telescope Find existing buffers" })
