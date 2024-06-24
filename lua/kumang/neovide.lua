vim.g.neovide_fullscreen = true
vim.g.neovide_transparency = 0.7
vim.g.neovide_cursor_animate_command_line = false
vim.o.guifont = "JetBrains Mono"
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_antialiasing = true

-- NOTE: Neovide bindings

local set = vim.keymap.set

set("n", "<S-CR>", "O<esc>", { desc = "Add enmpty line above" })
