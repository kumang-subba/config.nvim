return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gg", ":vertical G<Cr>", { desc = " Open Git fugitive", silent = true })
	end,
}
