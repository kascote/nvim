local ls = require 'luasnip'
local ps = ls.parser.parse_snippet

ls.snippets = {
  all = {
    ps('exp', '-- testing'),
  },
  dart = {
    ps('prn', [[print('$1');]]),
    ps('prnw', [[stderr.writeln('$1');]]),
    ps('if', 'if ($1) {\n  $2\n}'),
    ps('while', 'while ($1) {\n  $2\n}'),
    ps('try', 'try {\n  $1\n} catch (e) {\n\n} finally {\n}'),
    ps('sleep', 'sleep(Duration(seconds:$1));'),
  }
}
