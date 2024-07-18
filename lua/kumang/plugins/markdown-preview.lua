return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		vim.keymap.set(
			"n",
			"<leader>ms",
			":MarkdownPreview<Cr>",
			{ desc = "Markdown preivew start server", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>mq",
			":MarkdownPreviewStop<Cr>",
			{ desc = "Markdown preivew stop server", silent = true }
		)
	end,
}
