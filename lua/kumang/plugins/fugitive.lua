return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "Open Git fugitive" })
	end,
}
