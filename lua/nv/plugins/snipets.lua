local ls = require "luasnip"
local ps = ls.parser.parse_snippet
local s = ls.snippet
-- local c = ls.choice_node
-- local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
-- local sn = ls.snippet_node

ls.add_snippets("all", {
  ps("exp", "-- testing"),
})

ls.add_snippets("dart", {
  ps("prn", [[print('$1');]]),
  ps("prnw", [[stderr.writeln('$1');]]),
  ps("if", "if ($1) {\n  $2\n}"),
  ps("while", "while ($1) {\n  $2\n}"),
  ps("for", "for(var $1; $2 < $3; $4++) {\n $5\n}"),
  ps("try", "try {\n  $1\n} catch (e) {\n\n} finally {\n}"),
  ps("sleep", "sleep(Duration(seconds:$1));"),
})

local js_snippets = {
  ps(
    "jdesc",
    [[
describe('$1', () => {
  $2
});]]
  ),

  ps(
    "jit",
    [[
it('$1', () => {
  $2
});]]
  ),

  s(
    "import",
    fmt([[import {1} from '{2}';]], {
      i(1, ""),
      i(2, "path"),
    })
  ),

  ps("iface", [[
interface $1 {
  $2
}]]),

  ps("useState", [[const [$1, set$2] = useState($3);]]),
  ps("expectt", [[expect($1).toBeTruthy();]]),
  ps("expectf", [[expect($1).toBeFalsy();]]),

  ps("gtx", [[screen.getByText('$1')]]),
  ps("gts", [[screen.getByTextId('$1')]]),
  ps("glb", [[screen.getByLabelText('$1')]]),
  ps("gpc", [[screen.getByPlaceholderText('$1')]]),
}

ls.add_snippets("javascript", js_snippets)
ls.add_snippets("typescript", js_snippets)
ls.add_snippets("javascriptreact", js_snippets)
ls.add_snippets("typescriptreact", js_snippets)
