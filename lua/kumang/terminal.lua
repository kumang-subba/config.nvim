local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
	end,
})

-- NOTE: Auto enter insert mode on terminal
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.cmd(":startinsert")
		end
	end,
})

-- NOTE: C-t to exit and close terminal in terminal mode

vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:q!<CR>", { silent = true, desc = "Open/Close Terminal" })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { silent = true, desc = "Escape in Terminal" })
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>:q!<CR>", { silent = true, desc = "Open/Close Terminal" })

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<C-t>", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end, { desc = "Open/Close Terminal" })

-- NOTE: Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("t", "<C-a>", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
