local opt = vim.opt

opt.guicursor = ""
opt.cursorline = true

opt.smartcase = true
opt.ignorecase = true

opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2

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

vim.o.laststatus = 3
vim.api.nvim_set_hl(0, "highlightbg", { ctermbg = 0, bg = "#888888" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = " Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 100, higroup = "highlightbg" })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = " Disable new line comment",
})

local function run_current_file()
	local filename = vim.fn.expand("%:p")
	local ext = vim.fn.expand("%:e")

	if ext == "js" then
		vim.cmd("10split | terminal node " .. filename)
	elseif ext == "go" then
		vim.cmd("10split | terminal go run " .. filename)
	elseif ext == "ts" then
		vim.cmd("10split | terminal ts-node " .. filename)
	elseif ext == "c" then
		vim.cmd("10split | terminal ./main")
	else
		print("No runner defined for *." .. ext)
	end
end

local function compile()
	local ext = vim.fn.expand("%:e")
	if ext == "c" then
		vim.cmd("10split | terminal gcc main.c -o main")
	else
		print("No compile command defined for *." .. ext)
	end
end

vim.keymap.set("n", "<leader>ce", run_current_file, { silent = true, desc = " Execute program if available" })
vim.keymap.set("n", "<leader>cc", compile, { silent = true, desc = " Compile program if available" })
