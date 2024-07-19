return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key")
		local icons = require("nvim-web-devicons").get_icons()
		local gif = require("nvim-web-devicons").get_icon("gif")
		require("which-key").add({
			{ "<leader>e", desc = "Nvim tree", icon = { icon = gif } },
			{ "<leader>-", desc = "Oil floating window", icon = { icon = gif } },
			{ "<leader>c", group = "Lsp code actions" },
			{ "<leader>c_", hidden = true },
			{ "<leader>b", group = "Debug and Buffers" },
			{ "<leader>b_", hidden = true },
			{ "<leader>f", group = "Find" },
			{ "<leader>f_", hidden = true },
			{ "<leader>h", group = "Git Hunk" },
			{ "<leader>h_", hidden = true },
			{ "<leader>l", group = "Lazy,Live Server,LSPrestart" },
			{ "<leader>t", group = "Test" },
			{ "<leader>t_", hidden = true },
			{ "<leader>h_", group = "Git Hunk", mode = "v", icon = icons.Git },
			{ "<leader>u", desc = "Git undo tree", icon = icons.Git },
			{ "<leader>d", hidden = true },
			{ "<leader>y", hidden = true },
			{ "<leader>j", hidden = true },
			{ "<leader>a", hidden = true },
		})
	end,
}
