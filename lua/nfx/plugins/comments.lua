local c = require "kommentary.config"

c.configure_language("default", {
  -- prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})

c.configure_language("dart", {
  single_line_comment_string = "//",
  multi_line_comment_strings = { "/*", "*/" },
})
