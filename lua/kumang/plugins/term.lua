return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()
		vim.keymap.set("n", "<leader>ot", "<cmd>ToggleTerm<CR>", { desc = "Toggle term" })
	end,
}
