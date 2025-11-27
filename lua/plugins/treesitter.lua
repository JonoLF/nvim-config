return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        -- branch = "main",
        tag = "v0.10.0",
        build = ":TSUpdate",
        config = function()
            require"nvim-treesitter".setup{
                ensure_installed = { "python", "bash", "c", "cpp", "rust", "zig", "go" },
                sync_install = true,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    }
}
