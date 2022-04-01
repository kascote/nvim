local ls = require "luasnip"
local ps = ls.parser.parse_snippet

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
