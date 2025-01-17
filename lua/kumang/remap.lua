vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

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

set("n", "<S-down>", "<C-d>zz", { desc = "Page down on s down arrow" })
set("n", "<S-up>", "<C-u>zz", { desc = "Page up on s up arrow" })

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
