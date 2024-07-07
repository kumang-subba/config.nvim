local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add current file to harpoon" })
vim.keymap.set("n", "<C-p>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon menu" })

vim.keymap.set("n", "<c-i>", function()
	harpoon:list():select(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<c-o>", function()
	harpoon:list():select(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<C-[>", function()
	harpoon:list():select(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<C-]>", function()
	harpoon:list():select(4)
end, { desc = "Harpoon file 4" })
