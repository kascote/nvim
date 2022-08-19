local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

navic.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },

  highlight = true,
  -- separator = " " .. icons.codicon.chevronRight .. " ",
  separator = " > ", -- icons.codicon.chevronRight,
  -- limit for amount of context shown, 0 means no limit
  depth_limit = 0,
  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
}

--[[ navic.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["module-name"] = "%#CmpItemKindModule#" .. icons.codicon.symbolModule .. "%*" .. space,
    ["class-name"] = "%#CmpItemKindClass#" .. icons.codicon.symbolClass .. "%*" .. space, -- Classes and class-like objects
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.codicon.symbolMethod.. "%*" .. space, -- Methods (functions inside class-like objects)
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.codicon.symbolFunction .. "%*" .. space, -- Functions
    ["string-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolString .. "%*" .. space,
    ["number-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolNumber .. "%*" .. space,
    ["boolean-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolBoolean .. "%*" .. space,
    ["array-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolArray .. "%*" .. space,
    ["object-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolObject .. "%*" .. space,
    ["null-name"] = "%#CmpItemKindField#" .. icons.codicon.symbolField .. "%*" .. space,
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.codicon.tag .. "%*" .. " ", -- Tags (example: html tags)


    ["container-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolObject .. "%*" .. space, -- Containers (example: lua tables)
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolObject .. "%*" .. space,
    ["sequence-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolArray .. "%*" .. space,
    ["integer-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolNumber .. "%*" .. space,
    ["float-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolNumber .. "%*" .. space,
    ["table-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolProperty .. "%*" .. space,
    ["date-name"] = "%#CmpItemKindValue#" .. icons.codicon.calendar .. "%*" .. space,
    ["date-time-name"] = "%#CmpItemKindValue#" .. icons.codicon.calendar .. "%*" .. space,
    ["inline-table-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolProperty .. "%*" .. space,
    ["time-name"] = "%#CmpItemKindValue#" .. icons.codicon.watch .. "%*" .. space,
  },

  separator = " " .. icons.codicon.chevronRight .. " ",
  -- limit for amount of context shown, 0 means no limit
  depth = 0,
  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
  text_hl = "LineNr",
} ]]
