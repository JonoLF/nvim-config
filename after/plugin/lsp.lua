local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
lsp_zero.preset("recommended")
lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp_zero-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
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
local cmp_format = require('lsp-zero').cmp_format()
require('luasnip.loaders.from_vscode')
cmp.setup({
  sources = {
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'buffer'},
      {name = 'luasnip'},
  },
  --- (Optional) Show source name in completion menu
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  }),
  formatting = cmp_format,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
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
--lsp_zero.on_attach(function(client, bufnr)
--  local opts = {buffer = bufnr, remap = false}
--  vim.keymap.set("n", "gd", function() vim.lsp_zero.buf.definition() end, opts)
--  vim.keymap.set("n", "K", function() vim.lsp_zero.buf.hover() end, opts)

--end)
--lsp_zero.setup()
vim.diagnostic.config({
    virtual_text = true
})

