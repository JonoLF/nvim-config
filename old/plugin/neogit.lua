-- init.lua
local neogit = require('neogit')
neogit.setup {}
vim.keymap.set("n", "<C-g>", "<cmd>Neogit<CR>")
