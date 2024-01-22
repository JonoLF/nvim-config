local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp_zero-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})
-- here you can setup the language servers 
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-p>'] = cmp_action.luasnip_jump_forward(),
  ['<C-n>'] = cmp_action.luasnip_jump_backward(),
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
})
})

lsp_zero.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp_zero.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp_zero.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp_zero.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp_zero.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp_zero.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp_zero.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp_zero.buf.signature_help() end, opts)
end)
lsp_zero.setup()
vim.diagnostic.config({
    virtual_text = true
})

