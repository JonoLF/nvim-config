return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- 1. Setup Mason
        require("mason").setup()

        -- 2. Get cmp capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 3. Setup Mason-Lspconfig with a handler
        require("mason-lspconfig").setup({
            ensure_installed = { "pyright" }, -- Add other servers here
            handlers = {
                -- The default handler for all servers
                function(server_name)
                    vim.lsp.config(server_name, {
                        capabilities = capabilities,
                    })
                    vim.lsp.enable(server_name)
                end,

                -- Specific override for Pyright (optional, if you need custom settings)
                ["pyright"] = function()
                    vim.lsp.config("pyright", {
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    autoSearchPaths = true,
                                    diagnosticMode = "openFilesOnly",
                                    useLibraryCodeForTypes = true
                                }
                            }
                        }
                    })
                    vim.lsp.enable("pyright")
                end,
            }
        })
    end
}
