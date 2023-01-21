require("dressing").setup {
  select = {
    backend = { "telescope", "builtin" },
    telescope = require("telescope.themes").get_dropdown(),
  },
}
