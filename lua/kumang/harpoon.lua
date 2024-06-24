local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add current file to harpoon" })
vim.keymap.set("n", "<C-p>", ui.toggle_quick_menu, { desc = "Open harpoon menu" })

vim.keymap.set("n", "<c-i>", function()
	ui.nav_file(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<c-o>", function()
	ui.nav_file(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<C-[>", function()
	ui.nav_file(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<C-]>", function()
	ui.nav_file(4)
end, { desc = "Harpoon file 4" })
