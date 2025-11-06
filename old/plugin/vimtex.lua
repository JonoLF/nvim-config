-- Set plugin globals before Vimtex loads
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    options = {
        '-pdf',                  -- generate PDF
        '-pdflatex=pdflatex --shell-escape -interaction=nonstopmode -synctex=1', 
        '-file-line-error',      -- better error messages
        '-halt-on-error',        -- stop on first error
        '-verbose',              -- verbose log
    },
}

-- Optional: extra configuration, e.g. autocmds, keymaps if needed
-- Keymaps already done elsewhere
