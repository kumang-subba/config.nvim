local opt = vim.opt

-- opt.inccommand = "split"
opt.guicursor = ""

opt.smartcase = true
opt.ignorecase = true

opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.termguicolors = true

opt.scrolloff = 10

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

opt.updatetime = 50
opt.colorcolumn = "0"

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.laststatus = 3
vim.api.nvim_set_hl(0, "highlightbg", { ctermbg = 0, bg = "#999999" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 100, higroup = "highlightbg" })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable new line comment",
})
