-- ftplugin/markdown.lua
require("nvim-surround").buffer_setup({
    surrounds = {
        ["c"] = {
            add = { "```", "```" },
        }
    },
    indent_lines = false,
})
