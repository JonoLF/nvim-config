require("neogen").setup({ snippet_engine = "luasnip" })
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>nfu", ":lua require('neogen').generate({ type = 'doxyfunc' })<CR>", opts)
vim.keymap.set("n", "<leader>nfi", ":lua require('neogen').generate({ type = 'doxyfile' })<CR>", opts)
vim.keymap.set("n", "<leader>ns", ":lua require('neogen').generate({ type = 'doxystruct' })<CR>", opts)
vim.keymap.set("n", "<leader>nv", ":lua require('neogen').generate({ type = 'doxyvar' })<CR>", opts)

