vim.g.neovide_fullscreen = true
vim.g.neovide_transparency = 0.8
vim.g.neovide_cursor_animate_command_line = false
vim.o.guifont = "FiraCode Nerd Font"
vim.g.neovide_refresh_rate = 144
vim.g.neovide_cursor_trail_size = 0.8

-- NOTE: Neovide bindings

local set = vim.keymap.set

set("n", "<S-CR>", "O<esc>", { desc = "Add enmpty line above" })

-- NOTE: Move line up and down with alt
set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Alt j move line down n mode" })
set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Alt k move line up n mode" })
set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Alt j move line up v mode" })
set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Alt k move line up v mode" })
