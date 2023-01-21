return {
  "nvim-neorg/neorg",
  ft = "norg",
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.completion"] = {
        config = { engine = "nvim-cmp" },
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/Documents/notes/work",
            home = "~/Documents/notes/home",
          },
        },
      },
    },
  },
}
