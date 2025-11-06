return{
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function ()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    light = "mocha",
                    dark = "mocha",
                },
                transparent_background = false,
                term_colors = true,
                no_italic = false,
                no_bold = false,
                no_underline = false,
                styles = {
                    comments = {"italic"},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                default_integrations = true,
                integrations = {
                    treesitter = true,
                    treesitter_context = true,
                    telescope = {
                        enabled = true,
                    },
                    harpoon = true,
                    markdown = true,
                    mason = true,
                    cmp = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    lsp_trouble = true,
                    which_key = true,
                    diffview = true,
                },
            })
            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    }
}
