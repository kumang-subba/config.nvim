vim.g.neovide_fullscreen = true
vim.g.neovide_transparency = 0.7
vim.g.neovide_cursor_animate_command_line = false
vim.o.guifont = "FiraCode Nerd Font"
vim.g.neovide_refresh_rate = 144
vim.g.neovide_cursor_trail_size = 0.8

-- NOTE: Neovide bindings

local set = vim.keymap.set

set("n", "<S-CR>", "O<esc>", { desc = "Add enmpty line above" })
