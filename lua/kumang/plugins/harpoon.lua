return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = " Add to harpoon" })
		vim.keymap.set("n", "<C-p>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = " Harpoon menu" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = " Harpoon menu" })

		vim.keymap.set("n", "<C-n>", function()
			local list = harpoon:list()
			local count = list:length()
			if count == 0 then
				return
			end
			local current = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
			local next_index = 1
			for i = 1, 4 do
				local item = list:get(i)
				if item and vim.fn.fnamemodify(item.value, ":p") == current then
					next_index = (i % count) + 1
					break
				end
			end
			list:select(next_index)
		end, { desc = "Harpoon cycle 1-4" })

		-- vim.keymap.set("n", "<C-n>", function()
		-- 	harpoon:list():select(1)
		-- end, { desc = " Harpoon select 1" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():select(1)
		end, { desc = " Harpoon select 1" })
		vim.keymap.set("n", "<leader>hm", function()
			harpoon:list():select(2)
		end, { desc = " Harpoon select 2" })
		vim.keymap.set("n", "<leader>h,", function()
			harpoon:list():select(3)
		end, { desc = " Harpoon select 3" })
		vim.keymap.set("n", "<leader>h.", function()
			harpoon:list():select(4)
		end, { desc = " Harpoon select 4" })
	end,
}
