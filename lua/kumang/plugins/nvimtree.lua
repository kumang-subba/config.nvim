return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup()
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = " Nvim Tree toggle" })
	end,
}
