local ls = require('luasnip')

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

local date_input = function(args, snip, old_state, fmt)
	local fmt = fmt or "%Y-%m-%d"
	return sn(nil, i(1, os.date(fmt)))
end

ls.add_snippets("c", {
    s("fancycom", {
        t({"/****************************************", " * "}),
        i(1, "COMMENT TEXT"),
        t({""," ****************************************/"}),
    }),
    s("multicom", {
        t({"/*", " * "}),
        i(1, "COMMENT TEXT"),
        t({"", " */"}),
    }),
    s("doxyfile", {
        t({"/**"}),
        t({""," * @file "}),
        t({""," * @brief "}),
        i(1, "Brief description of the file"),
        t({""," *"}),
        t({""," * @author "}),
        i(2, "Jonathan Faller"),
        t({""," *"}),
        t({""," * @date "}),
        d(3, date_input, {}, { user_args = { "%A, %B %d of %Y" } }),
        t({""," */"}),
    }),
    s("doxyfunc", {
        t({"/**"}),
        t({""," * @function "}),
        t({""," * @brief "}),
        i(1, "Brief description of the function"),
        t({""," *"}),
        t({""," * @param "}),
        i(2, "PARAMS"),
        t({""," *"}),
        t({""," * @return "}),
        i(3, "RETURNS"),
        t({""," */"}),
    }),
    s("doxystruct", {
        t({"/**"}),
        t({""," * @struct "}),
        t({""," * @brief "}),
        i(1, "Brief description of the struct"),
        t({""," */"}),
    }),
    s("doxyvar", {
        t({"/**"}),
        t({""," * @var "}),
        t({""," * @brief "}),
        i(1, "Brief description of the var"),
        t({""," */"}),
    }),
}
)

ls.add_snippets("cpp", {
    s("fancycom", {
        t({"/****************************************", " * "}),
        i(1, "COMMENT TEXT"),
        t({""," ****************************************/"}),
    }),
    s("doxyfile", {
        t({"/**"}),
        t({""," * @file "}),
        t({""," * @brief "}),
        i(1, "Brief description of the file"),
        t({""," *"}),
        t({""," * @author "}),
        i(2, "Jonathan Faller"),
        t({""," *"}),
        t({""," * @date "}),
        d(3, date_input, {}, { user_args = { "%A, %B %d of %Y" } }),
        t({""," */"}),
    }),
    s("doxyfunc", {
        t({"/**"}),
        t({""," * @function "}),
        t({""," * @brief "}),
        i(1, "Brief description of the function"),
        t({""," *"}),
        t({""," * @param "}),
        i(2, "PARAMS"),
        t({""," *"}),
        t({""," * @return "}),
        i(3, "RETURNS"),
        t({""," */"}),
    }),
    s("doxystruct", {
        t({"/**"}),
        t({""," * @struct "}),
        t({""," * @brief "}),
        i(1, "Brief description of the struct"),
        t({""," */"}),
    }),
    s("doxyvar", {
        t({"/**"}),
        t({""," * @var "}),
        t({""," * @brief "}),
        i(1, "Brief description of the var"),
        t({""," */"}),
    }),
}
)
