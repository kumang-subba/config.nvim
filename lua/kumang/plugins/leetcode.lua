return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
		"3rd/image.nvim",
	},
	opts = {
		---@type string
		arg = "leetcode.nvim",

		---@type lc.lang
		lang = "c",

		cn = { -- leetcode.cn
			enabled = false, ---@type boolean
			translator = true, ---@type boolean
			translate_problems = true, ---@type boolean
		},

		---@type lc.storage
		storage = {
			home = vim.fn.stdpath("data") .. "/leetcode",
			cache = vim.fn.stdpath("cache") .. "/leetcode",
		},

		---@type table<string, boolean>
		plugins = {
			non_standalone = false,
		},

		---@type boolean
		logging = true,

		injector = {}, ---@type table<lc.lang, lc.inject>

		cache = {
			update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
		},

		editor = {
			reset_previous_code = true, ---@type boolean
			fold_imports = true, ---@type boolean
		},

		console = {
			open_on_runcode = true, ---@type boolean

			dir = "row", ---@type lc.direction

			size = { ---@type lc.size
				width = "90%",
				height = "75%",
			},

			result = {
				size = "60%", ---@type lc.size
			},

			testcase = {
				virt_text = true, ---@type boolean

				size = "40%", ---@type lc.size
			},
		},

		description = {
			position = "left", ---@type lc.position

			width = "40%", ---@type lc.size

			show_stats = true, ---@type boolean
		},

		---@type lc.picker
		picker = { provider = nil },

		hooks = {
			---@type fun()[]
			["enter"] = {},

			---@type fun(question: lc.ui.Question)[]
			["question_enter"] = {},

			---@type fun()[]
			["leave"] = {},
		},
		keys = {
			toggle = { "q" }, ---@type string|string[]
			confirm = { "<CR>" }, ---@type string|string[]
			reset_testcases = "r", ---@type string
			use_testcase = "U", ---@type string
			focus_testcases = "H", ---@type string
			focus_result = "L", ---@type string
		},
		---@type lc.highlights
		theme = {},
		---@type boolean
		image_support = true,
	},
	config = function(_, opts)
		require("leetcode").setup(opts)

		local set = vim.keymap.set
		set("n", "<leader>le", "<cmd>Leet<cr>", { silent = true, desc = " Leetcode Start" })
		set("n", "<leader>lq", "<cmd>Leet exit<cr>", { silent = true, desc = " Leetcode Exit" })
		set("n", "<leader>lt", "<cmd>Leet test<cr>", { silent = true, desc = " Leetcode Test/Run" })
		set("n", "<leader>ls", "<cmd>Leet submit<cr>", { silent = true, desc = " Leetcode Submit" })
		set("n", "<leader>lc", "<cmd>Leet lang<cr>", { silent = true, desc = " Leetcode Lang" })
		set("n", "<leader>lh", "<cmd>Leet hint<cr>", { silent = true, desc = " Leetcode Hints" })
		set("n", "<leader>lo", "<cmd>Leet open<cr>", { silent = true, desc = " Leetcode open" })
	end,
}
