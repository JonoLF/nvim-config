require("jono.remap")
require("jono.packer")
require("jono.set")
-- require("jono.lazy")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

--vim.opt.formatoptions:remove('o')
vim.cmd [[ autocmd FileType * setlocal formatoptions-=o ]]
vim.api.nvim_create_autocmd('User', { pattern = 'LeapEnter',
    callback = function()
      vim.cmd.hi('Cursor', 'blend=100')
      vim.opt.guicursor:append { 'a:Cursor/lCursor' }
    end,
  }
)
vim.api.nvim_create_autocmd('User', { pattern = 'LeapLeave',
    callback = function()
      vim.cmd.hi('Cursor', 'blend=0')
      vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
    end,
  }
)

vim.o.clipboard = 'unnamedplus'

--vim.cmd([[
--  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
--]])
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true;
-- modify cindent to stop c and cpp preprocessor directives from being autoaligned to the beginning of the line
vim.opt.cinoptions = vim.opt.cinoptions - "p";
