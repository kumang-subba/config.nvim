vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set
vim.g.keyboard_format = "colemak_dhm"

local n_keymap = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

if vim.g.keyboard_format == "colemak_dhm" then
	n_keymap("n", "m", "h")
	n_keymap("n", "M", "H")
	n_keymap("n", "j", "m")
	n_keymap("n", "J", "M")
	n_keymap("n", "n", "j")
	n_keymap("n", "N", "J")
	n_keymap("n", "h", "e")
	n_keymap("n", "H", "E")
	n_keymap("n", "k", "n")
	n_keymap("n", "K", "N")
	n_keymap("n", "l", "i")
	n_keymap("n", "L", "I")
	n_keymap("n", "e", "k")
	n_keymap("n", "E", "K")
	n_keymap("n", "i", "l")
	n_keymap("n", "I", "L")

	n_keymap("o", "m", "h")
	n_keymap("o", "M", "H")
	n_keymap("o", "j", "m")
	n_keymap("o", "J", "M")
	n_keymap("o", "n", "j")
	n_keymap("o", "N", "J")
	n_keymap("o", "h", "e")
	n_keymap("o", "H", "E")
	n_keymap("o", "k", "n")
	n_keymap("o", "K", "N")
	n_keymap("o", "l", "i")
	n_keymap("o", "L", "I")
	n_keymap("o", "e", "k")
	n_keymap("o", "E", "K")
	n_keymap("o", "i", "l")
	n_keymap("o", "I", "L")

	n_keymap("v", "m", "h")
	n_keymap("v", "M", "H")
	n_keymap("v", "j", "m")
	n_keymap("v", "J", "M")
	n_keymap("v", "n", "j")
	n_keymap("v", "N", "J")
	n_keymap("v", "h", "e")
	n_keymap("v", "H", "E")
	n_keymap("v", "k", "n")
	n_keymap("v", "K", "N")
	n_keymap("v", "l", "i")
	n_keymap("v", "L", "I")
	n_keymap("v", "e", "k")
	n_keymap("v", "E", "K")
	n_keymap("v", "i", "l")
	n_keymap("v", "I", "L")

	set("o", "I", "$", { desc = "Go to end of line on operator pending mode" })
	set("o", "M", "^", { desc = "Go to start of line on operator pending mode" })
	set("n", "<S-m>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
	set("n", "<S-i>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

	-- NOTE: Move line up and down with alt
	set("n", "<A-n>", ":m .+1<CR>==", { silent = true, desc = "Alt j move line down n mode" })
	set("n", "<A-e>", ":m .-2<CR>==", { silent = true, desc = "Alt k move line up n mode" })
	set("v", "<A-n>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Alt j move line up v mode" })
	set("v", "<A-e>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Alt k move line up v mode" })

	set("n", "<S-m>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
	set("n", "<S-i>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
	set("n", "<M-m>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
	set("n", "<M-i>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
else
	set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "J move line in visual mode" })
	set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "K move line in visual mode" })
	set("o", "L", "$", { desc = "Go to end of line on operator pending mode" })
	set("o", "H", "^", { desc = "Go to start of line on operator pending mode" })
	set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
	set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

	set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
	set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
	set("n", "<M-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
	set("n", "<M-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
	-- NOTE: Move line up and down with alt
	set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Alt j move line down n mode" })
	set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Alt k move line up n mode" })
	set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Alt j move line up v mode" })
	set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Alt k move line up v mode" })
end

set("n", "<leader>s", "<C-w>s", { desc = "Split window vertical" })
set("n", "<C-q>", ":q<Cr>", { desc = "Delete window", silent = true })
set("n", "<C-s>", "<C-x>", { desc = "Substract number" })

set("n", "<CR>", "o<esc>", { desc = "Add empty line below" })
set("n", "<S-CR>", "O<esc>", { desc = "Add empty line above" })
set("n", "<C-CR>", "O<esc>", { desc = "Add empty line above" })
set("n", "<M-CR>", "O<esc>", { desc = "Add empty line above" })

set("n", "<leader>j", "mzJ`z", { desc = "<leader>j Joins line preserving cursor" })

set("n", "<leader>d", "dd", { desc = "Delete one line" })
set("n", "<leader>y", "yy", { desc = "Yank one line" })

-- set("n", "<S-down>", "<C-d>zz", { desc = "Page down on s down arrow" })
-- set("n", "<S-up>", "<C-u>zz", { desc = "Page up on s up arrow" })

set("n", "<C-d>", "<C-d>zz", { desc = "Center screen on C-d" })
set("n", "<C-u>", "<C-u>zz", { desc = "Center screen on C-u" })
set("o", "<S-right>", "$", { desc = "Go to end of line on operator pending mode" })
set("o", "<S-left>", "^", { desc = "Go to start of line on operator pending mode" })

set("n", "<leader>w", ":w<CR>", { silent = true, desc = "Save file" })

set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Go back to Explorer" })

set("n", "<S-left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
set("n", "<S-right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

set("n", "<leader>q", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- NOTE: Live-server
set("n", "<leader>ls", ":LiveServerStart<CR>", { desc = "Live server start", silent = true })
set("n", "<leader>lq", ":LiveServerStop<CR>", { desc = "Live server stop", silent = true })

set("n", "<M-down>", ":m .+1<CR>==", { silent = true, desc = "Alt j move line down n mode" })
set("n", "<M-up>", ":m .-2<CR>==", { silent = true, desc = "Alt k move line up n mode" })
set("v", "<M-down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Alt j move line up v mode" })
set("v", "<M-up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Alt k move line up v mode" })
set("t", "<esc><esc>", "<C-\\><C-n>", { silent = true, desc = "Escape in Terminal" })

-- NOTE: Turn on/off format on save
set("n", "<leader>fq", ":autocmd! BufWritePre<Cr>", { desc = "Disable autoformat on save", silent = true })
set("n", "<leader>fs", function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function(args)
			require("conform").format({
				bufnr = args.buf,
				lsp_fallback = true,
				quiet = true,
			})
		end,
	})
end, { desc = "Enable autoformat on save" })
