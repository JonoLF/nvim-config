vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")

-- navigate up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- next and previous search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selection without rewriting default register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- delete using black hole register, so that it doesn't overwrite default register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- disable accidently entry into Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- navigate lists
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search replace for word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- fix accidental capital W to save
vim.cmd('command W w')
-- insert lines above or below without entering insert
vim.keymap.set("n", "<leader>o", "o<Esc>", { silent = true })
vim.keymap.set("n", "<leader>O", "O<Esc>", { silent = true })
vim.keymap.set("x", "p", '"_dP')  -- Deletes the selected text and pastes without affecting unnamed register
vim.keymap.set("x", "s", '"_s')  -- Use black hole register to avoid overwriting unnamed register

vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<CR>")

-- Remap all `s` commands to use the black hole register
vim.keymap.set({'n', 'v'}, 's', '"_s')    -- Normal and Visual modes for `s`
vim.keymap.set('n', 'S', '"_S')           -- Normal mode for `S`

vim.keymap.set('n','<Leader>lc',':VimtexCompile<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<Leader>lv',':VimtexView<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<Leader>lk',':VimtexStop<CR>',{noremap=true,silent=true})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr})
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr})
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr})
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr})
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr})
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr})
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr})
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr})
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, {buffer = bufnr})
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
