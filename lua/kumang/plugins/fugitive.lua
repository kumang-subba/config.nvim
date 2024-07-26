return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", ":vertical G<Cr>", { desc = "Open Git fugitive", silent = true })
	end,
}
