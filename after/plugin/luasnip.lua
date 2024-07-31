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
	local fmt_local = fmt or "%Y-%m-%d"
	return sn(nil, i(1, os.date(fmt_local)))
end

ls.add_snippets("all", {
    s("date", {
        d(1, date_input, {}, { user_args = { "%A, %B %d of %Y" } }),
    }),
    s("if", {
        t({"if ("}),
        i(1,"conditions"),
        t({") {"}),
        t({"","\t"}),
        i(2,"if code"),
        t({"","}"}),
    }),
    s("else", {
        t({"else {"}),
        t({"","\t"}),
        i(1,"else code"),
        t({"","}"}),
    }),
    s("ifelse", {
        t({"if ("}),
        i(1,"conditions"),
        t({") {"}),
        t({"","\t"}),
        i(2,"if code"),
        t({"","} else {"}),
        t({"","\t"}),
        i(3,"else code"),
        t({"","}"}),
    }),
    s("elif", {
        t({"else if ("}),
        i(1,"conditions"),
        t({") {"}),
        t({"","\t"}),
        i(2,"elif code"),
        t({"","}"}),
    }),
    s("trycatch", {
        t({"try {"}),
        t({"","\t"}),
        i(1,"code"),
        t({"","} catch (error) {"}),
        t({"","\t"}),
        i(2,"catch code"),
        t({"","}"}),
    }),
    s("while", {
        t({"while ("}),
        i(1,"condition"),
        t({") {"}),
        t({"","\t"}),
        i(2,"code"),
        t({"","}"}),
    }),
})
ls.add_snippets("sh", {
    s("errorhandling", {
        t({"set -e"}),
        t({"", "trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG"}),
        t({"", "if [ $? -ne 0 ]; then"}),
        t({"", "\ttrap 'echo \"\\\"${last_command}\\\" command had an exit code $?\"' EXIT"}),
        t({"", "fi"})
    })
})
ls.add_snippets("python", {
    s("elif", {
        t({"elif ("}),
        i(1,"conditions"),
        t({") {"}),
        t({"","\t"}),
        i(2,"elif code"),
        t({"","}"}),
    }),
})
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
        i(1, "name"),
        t({""," * @brief "}),
        i(2, "Brief description of the var"),
        t({""," */"}),
    }),
    s("disprint", {
        t({"printf(\"--------------------\\n\");", ""}),
        t({"printf(\""}),
        i(1, "user input"),
        t({"\\n\");", "printf(\"--------------------\\n\");"})
    }),
    s("fori", {
        t({"for (uint8_t "}), i(1, "var"), t({" = "}), i(2, "init"), t({"; "}), i(3, "var"), t({" "}), i(4, " operator "), t({" "}), i(5, "limit"), t({"; "}), i(6, "var"), t({"++) {"}),
        t({"", "\t"}), i(7, "code"),
        t({"", "}"})
    })
})
ls.add_snippets("cpp", {
    s("main", {
        t({"int main(int argc, char* argv[]){"}),
        t({"","\t"}),
        i(1, "main code"),
        t({"", "}"})
    }),
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
        i(1, "name"),
        t({""," * @brief "}),
        i(2, "Brief description of the var"),
        t({""," */"}),
    }),
    s("disprint", {
        t({"printf(\"--------------------\\n\");", ""}),
        t({"printf(\""}),
        i(1, "user input"),
        t({"\\n\");", "printf(\"--------------------\\n\");"})
    }),
    s("fori", {
        t({"for (auto "}), i(1, "var"), t({" = "}), i(2, "init"), t({"; "}), i(3, "var"), t({" "}), i(4, " operator "), t({" "}), i(5, "limit"), t({"; "}), i(6, "var"), t({"++) {"}),
        t({"", "\t"}), i(7, "code"),
        t({"", "}"})
    })
});
ls.add_snippets("javascript", {
    s("fancycom", {
        t({"/****************************************", " * "}),
        i(1, "COMMENT TEXT"),
        t({""," ****************************************/"}),
    }),
    s("jsdocfile", {
        t({"/**"}),
        t({""," * @file "}),
        i(1, "Brief description of the file"),
        t({""," *"}),
        t({""," * @author "}),
        i(2, "Jonathan Faller"),
        t({""," *"}),
        t({""," * @date "}),
        d(3, date_input, {}, { user_args = { "%A, %B %d of %Y" } }),
        t({""," */"}),
    }),
    s("jsdocfunc", {
        t({"","/**"}),
        t({""," * "}),
        i(1, "description"),
        t({""," * @function "}),
        i(2, "name"),
        t({""," *"}),
        t({""," * @param "}),
        i(3, "PARAMS"),
        t({""," *"}),
        t({""," * @return "}),
        i(4, "RETURNS"),
        t({""," */"}),
    }),
    s("jsdocafunc", {
        t({"","/**"}),
        t({""," * "}),
        i(1, "description"),
        t({""," * @async "}),
        t({""," * @function "}),
        i(2, "name"),
        t({""," *"}),
        t({""," * @param "}),
        i(3, "PARAMS"),
        t({""," *"}),
        t({""," * @return "}),
        i(4, "RETURNS"),
        t({""," */"}),
    }),
    s("jsdocvar", {
        t({"","/**"}),
        t({""," * "}),
        i(1, "description"),
        t({""," * @name "}),
        i(2, "variable name"),
        t({""," * @type {"}),
        i(3, "variable type"),
        t({"}"}),
        t({""," */"}),
    }),
    s("jsdocobj", {
        t({"","/**"}),
        t({""," * "}),
        i(1, "description"),
        t({""," * @type {Object}"}),
        t({""," * @property {"}),
        i(2, "type"),
        t({"} "}),
        i(3, "param name and desc"),
        t({""," */"}),
    }),
    s("promise", {
        t({"new Promise((resolve, reject) => {"}),
        t({"","\t"}),
        i(1, "code"),
        t({"","});"}),
    }),
    s("apromise", {
        t({"new Promise(async(resolve, reject) => {"}),
        t({"","\t"}),
        i(1, "code"),
        t({"","});"}),
    }),
    s("resolve", {
        t({"resolve("}),
        i(1, "fufillment"),
        t({");"}),
    }),
    s("reject", {
        t({"reject("}),
        i(1, "reason"),
        t({");"}),
    }),
    s("function", {
        t({"function "}),
        i(1,"name"),
        t({"("}),
        i(2,"parameters"),
        t({") {"}),
        t({"","\t"}),
        i(3,"code"),
        t({"","}"}),
    }),
    s("afunction", {
        t({"async function "}),
        i(1,"name"),
        t({"("}),
        i(2,"parameters"),
        t({") {"}),
        t({"","\t"}),
        i(3,"code"),
        t({"","}"}),
    }),
    s("error", {
        t({"new Error("}),
        i(1,"error"),
        t({");"}),
    }),
    s("conlog", {
        t({"console.log("}),
        i(1,"log statement"),
        t({");"}),
    }),
    s("conerr", {
        t({"console.error("}),
        i(1,"error statement"),
        t({");"}),
    }),
    s(".catch", {
        t({".catch((error) => {"}),
        t({"","\tconsole.error(error.name)"}),
        t({"","\tconsole.error(error.message)"}),
        t({"","\tconsole.error(error.message)"}),
        t({"","});"}),
    }),
    s(".then", {
        t({".then(("}),
        i(1,"value"),
        t({") => {"}),
        t({"","\t"}),
        i(2, "code"),
        t({"","})"}),
    }),
    s(".athen", {
        t({".then(async("}),
        i(1,"value"),
        t({") => {"}),
        t({"","\t"}),
        i(2, "code"),
        t({"","})"}),
    }),
    s(".finally", {
        t({".finally(("}),
        i(1,"value"),
        t({") => {"}),
        t({"","\t"}),
        i(2, "code"),
        t({"","});"}),
    }),
    s("fori", {
        t({"for (let "}), i(1, "var"), t({" = "}), i(2, "init"), t({"; "}), i(3, "var"), t({" "}), i(4, " operator "), t({" "}), i(5, "limit"), t({"; "}), i(6, "var"), t({"++) {"}),
        t({"", "\t"}), i(7, "code"),
        t({"", "}"})
    })
})
