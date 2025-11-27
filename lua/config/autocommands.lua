vim.lsp.handlers["textDocument/inlineCompletion"] = function() end
vim.lsp.handlers["textDocument/inlineEdit"] = function() end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        if ft == "tex" then
            vim.diagnostic.enable(false, { bufnr = buf })
            if vim.lsp.inlay_hint then
                vim.lsp.inlay_hint.enable(false, { bufnr = buf })
            end
            vim.lsp.handlers["textDocument/inlineCompletion"] = function() end
            vim.lsp.handlers["textDocument/inlineEdit"] = function() end
        end
    end,
})
