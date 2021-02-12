local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["Enter"] = actions.goto_file_selection_edit + actions.center
      }
    }
  }
}
