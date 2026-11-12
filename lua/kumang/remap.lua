vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set("v", "J", "<cmd>m '>+1<CR>gv=gv", { silent = true, desc = " J move line in visual mode" })
set("v", "K", "<cmd>m '<-2<CR>gv=gv", { silent = true, desc = " K move line in visual mode" })
set("o", "L", "$", { desc = " Go to end of line on operator pending mode" })
set("o", "H", "^", { desc = " Go to start of line on operator pending mode" })
set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = " Open diagnostic under cursor", silent = true })

set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = " Prev Buffer" })
set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = " Next Buffer" })
set("n", "<M-h>", "<cmd>BufferLineMovePrev<cr>", { desc = " Move buffer left" })
set("n", "<M-l>", "<cmd>BufferLineMoveNext<cr>", { desc = " Move buffer right" })

-- NOTE: Move line up and down with alt
set("n", "<A-j>", "<cmd>m .+1<CR>==", { silent = true, desc = " Alt j move line down n mode" })
set("n", "<A-k>", "<cmd>m .-2<CR>==", { silent = true, desc = " Alt k move line up n mode" })
set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { silent = true, desc = " Alt j move line up v mode" })
set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { silent = true, desc = " Alt k move line up v mode" })

set("n", "<leader>wv", "<C-w>v", { desc = " Split window vertical" })
set("n", "<leader>ws", "<C-w>s", { desc = " Split window horizontal" })
set("n", "<C-q>", "<cmd>q<Cr>", { desc = " Delete Buffer and Window", silent = true })
set("n", "<leader>wd", "<cmd>q<Cr>", { desc = " Delete Buffer and Window", silent = true })
set("n", "<C-s>", "<C-x>", { desc = " Substract number" })

set("n", "<CR>", "o<esc>", { desc = " Add empty line below" })
set("n", "<S-CR>", "O<esc>", { desc = " Add empty line above" })
set("n", "<C-CR>", "O<esc>", { desc = " Add empty line above" })
set("n", "<M-CR>", "O<esc>", { desc = " Add empty line above" })

set("n", "<leader>j", "mzJ`z", { desc = "<leader>j Joins line preserving cursor" })

set("n", "<S-down>", "<C-d>zz", { desc = " Page down on s down arrow" })
set("n", "<S-up>", "<C-u>zz", { desc = " Page up on s up arrow" })

set("n", "J", "<C-d>zz", { desc = " Page down on s down arrow" })
set("n", "K", "<C-u>zz", { desc = " Page up on s up arrow" })

set("n", "<C-d>", "<C-d>zz", { desc = " Center screen on C-d" })
set("n", "<C-u>", "<C-u>zz", { desc = " Center screen on C-u" })
set("o", "<S-right>", "$", { desc = " Go to end of line on operator pending mode" })
set("o", "<S-left>", "^", { desc = " Go to start of line on operator pending mode" })

set("n", "<leader>fs", "<cmd>w<CR>", { silent = true, desc = " Save file" })
set("n", "<leader>fS", "<cmd>wa<CR>", { silent = true, desc = " Save all files" })

set("n", "<leader>hh", ":h ", { desc = " Save file" })

set("n", "<S-left>", "<cmd>bprevious<cr>", { desc = " Prev Buffer" })
set("n", "<S-right>", "<cmd>bnext<cr>", { desc = " Next Buffer" })

set("n", "<leader>q", "<cmd>bd<cr>", { desc = " Delete window" })
set("n", "<leader>fd", "<cmd>bd<cr>", { desc = " Delete Buffer and Window" })
set("n", "<leader>bd", "<cmd>bd<cr>", { desc = " Delete Buffer and Window" })
set("n", "<leader>bk", "<cmd>bd<cr>", { desc = " Delete Buffer and Window" })

set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = " Lazy" })

set("n", "<M-down>", "<cmd>m .+1<CR>==", { silent = true, desc = " Alt j move line down n mode" })
set("n", "<M-up>", "<cmd>m .-2<CR>==", { silent = true, desc = " Alt k move line up n mode" })
set("v", "<M-down>", "<cmd>m '>+1<CR>gv=gv", { silent = true, desc = " Alt j move line up v mode" })
set("v", "<M-up>", "<cmd>m '<-2<CR>gv=gv", { silent = true, desc = " Alt k move line up v mode" })
set("t", "<esc><esc>", "<C-\\><C-n>", { silent = true, desc = " Escape in Terminal" })

set("n", "<leader><leader>", "<C-\\><C-n>", { silent = true, desc = " Escape in Terminal" })

set("n", "<C-S-J>", "<cmd>res +5<cr>", { silent = true, desc = " Increase split window down" })
set("n", "<C-S-K>", "<cmd>res -5<cr>", { silent = true, desc = " Decrease split window down" })
set("n", "<C-S-H>", "<cmd>vert: res +5<cr>", { silent = true, desc = " Increase split window left" })
set("n", "<C-S-L>", "<cmd>vert: res -5<cr>", { silent = true, desc = " Decrease split window right" })
