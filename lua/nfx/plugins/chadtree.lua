local chadtree_settings = {
  theme = {
    text_colour_set = "nerdtree_syntax_dark",
    icon_glyph_set = "ascii",
  },
  keymap = {
    open_sys = {"x"},
    primary = {"o"},
    cut = {"m"},
  },
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
