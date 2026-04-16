return {
	"barrett-ruth/live-server.nvim",
	config = function()
		vim.g.live_server = {
			port = 8080,
			browser = "default",
		}
	end,
}
