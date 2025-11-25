require("jono")
vim.wo.relativenumber = true
vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin-mocha"
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

