return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "RchrdAriza/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local time = os.date("%H:%M")
		local date = os.date("%a %d %b")
		local v = vim.version()
		local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

		-- Set header
		dashboard.section.header.val = {
			" ▄█   ▄█▄ ███    █▄    ▄▄▄▄███▄▄▄▄      ▄████████ ███▄▄▄▄      ▄██████▄ ",
			"███ ▄███▀ ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███▀▀▀██▄   ███    ███",
			"███▐██▀   ███    ███ ███   ███   ███   ███    ███ ███   ███   ███    █▀ ",
			"█████▀    ███    ███ ███   ███   ███   ███    ███ ███   ███  ▄███       ",
			"█████▄    ███    ███ ███   ███   ███ ▀███████████ ███   ███ ▀▀███ ████▄ ",
			"███▐██▄   ███    ███ ███   ███   ███   ███    ███ ███   ███   ███    ███",
			"███ ▀███▄ ███    ███ ███   ███   ███   ███    ███ ███   ███   ███    ███",
			"███   ▀█▀ ████████▀   ▀█   ███   █▀    ███    █▀   ▀█   █▀    ████████▀ ",
			"▀                                                                       ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button(".", "󰮗   Find file", ":Telescope find_files<CR>"),
			dashboard.button("e", "   File Explorer", ":Oil<CR>"),
			dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("/", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
			dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
		}

		function centerText(text, width)
			local totalPadding = width - #text
			local leftPadding = math.floor(totalPadding / 2)
			local rightPadding = totalPadding - leftPadding
			return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
		end

		dashboard.section.footer.val = {
			centerText(date, 50),
			centerText(time, 50),
			centerText(version, 50),
		}

		local height = vim.fn.winheight(0)

		local header_height = #dashboard.section.header.val
		local buttons_height = #dashboard.section.buttons.val
		local footer_height = #dashboard.section.footer.val

		local content_height = header_height + buttons_height + footer_height
		local remaining = math.max(0, height - content_height - 2)

		local top_padding = math.floor(remaining / 2)
		local section_padding = 1

		dashboard.config.layout = {
			{ type = "padding", val = top_padding },
			dashboard.section.header,
			{ type = "padding", val = section_padding },
			dashboard.section.buttons,
			{ type = "padding", val = section_padding },
			dashboard.section.footer,
		}

		-- Send config to alpha
		alpha.setup(dashboard.config)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
