return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_auto_close = 0
		vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewToggle<cr>", { desc = " Markdown preview toggle" })
	end,
}
