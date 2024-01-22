require('refactoring').setup({
    prompt_func_return_type = {
        go = false,
        java = false,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
    },
    prompt_func_param_type = {
        go = false,
        java = false,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = false, -- shows a message with information about the refactor on success
                                  -- i.e. [Refactor] Inlined 3 variable occurrences
})

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set(
	"n",
	"<leader>rp",
	function() require('refactoring').debug.printf({below = true}) end
)
-- Print var
vim.keymap.set({"x", "n"}, "<leader>pva", function() require('refactoring').debug.print_var() end)
-- Supports both visual and normal mode
vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end)
-- Supports only normal mode
