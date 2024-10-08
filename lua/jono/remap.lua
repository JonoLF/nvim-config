vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- create numbered list from visual selection
--vim.keymap.set("v", "<leader>nl", [[:s/^/\=line('.') - line("'<") + 1 . '. '/e<CR>]])
---- remove numbered list from visual selection
--vim.keymap.set("v", "<leader>nd", [[:s/^\d./^/e<CR>]])
---- create bulleted list from visual selection
--vim.keymap.set("v", "<leader>bl", [[:s/^/* /e<CR>]])
---- delete bulleted list from visual selection
--vim.keymap.set("v", "<leader>bd", [[:s/^* /^/e<CR>]])
-- put visual selection in code block

--vim.keymap.set("v", "<leader>cb", [[:s/^/```<CR>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/jono/packer.lua<CR>");

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)

--vim.keymap.set("n", ":W", ":w<CR>" , {noremap = true, silent = true})
vim.cmd('command W w')
vim.keymap.set("n", "<leader>o", "o<Esc>", { silent = true })
vim.keymap.set("n", "<leader>O", "O<Esc>", { silent = true })
vim.keymap.set("x", "p", '"_dP')  -- Deletes the selected text and pastes without affecting unnamed register
vim.keymap.set("x", "s", '"_s')  -- Use black hole register to avoid overwriting unnamed register

-- create new tab
vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<CR>")

-- Remap all `c` commands to use the black hole register
-- vim.keymap.set({'n', 'v'}, 'c', '"_c')    -- Normal and Visual modes for `c`
-- No need to remap `cw` separately

-- Remap `C` and `cc` separately, since they are individual commands
-- vim.keymap.set('n', 'C', '"_C')           -- Normal mode for `C`
-- vim.keymap.set('n', 'cc', '"_cc')         -- Normal mode for `cc`

-- Remap all `s` commands to use the black hole register
vim.keymap.set({'n', 'v'}, 's', '"_s')    -- Normal and Visual modes for `s`
vim.keymap.set('n', 'S', '"_S')           -- Normal mode for `S`

