local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

local icons = require "nv.icons"
local space = ""

gps.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.codicon.symbolClass .. "%*" .. space, -- Classes and class-like objects
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.codicon.symbolFunction .. "%*" .. space, -- Functions
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.codicon.symbolMethod.. "%*" .. space, -- Methods (functions inside class-like objects)
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolObject .. "%*" .. space, -- Containers (example: lua tables)
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.codicon.tag .. "%*" .. " ", -- Tags (example: html tags)
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolObject .. "%*" .. space,
    ["sequence-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolArray .. "%*" .. space,
    ["null-name"] = "%#CmpItemKindField#" .. icons.codicon.symbolField .. "%*" .. space,
    ["boolean-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolBoolean .. "%*" .. space,
    ["integer-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolNumber .. "%*" .. space,
    ["float-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolNumber .. "%*" .. space,
    ["string-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolString .. "%*" .. space,
    ["array-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolArray .. "%*" .. space,
    ["object-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolObject .. "%*" .. space,
    ["number-name"] = "%#CmpItemKindValue#" .. icons.codicon.symbolNumber .. "%*" .. space,
    ["table-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolProperty .. "%*" .. space,
    ["date-name"] = "%#CmpItemKindValue#" .. icons.codicon.calendar .. "%*" .. space,
    ["date-time-name"] = "%#CmpItemKindValue#" .. icons.codicon.calendar .. "%*" .. space,
    ["inline-table-name"] = "%#CmpItemKindProperty#" .. icons.codicon.symbolProperty .. "%*" .. space,
    ["time-name"] = "%#CmpItemKindValue#" .. icons.codicon.watch .. "%*" .. space,
    ["module-name"] = "%#CmpItemKindModule#" .. icons.codicon.symbolModule .. "%*" .. space,
  },

  separator = " " .. icons.codicon.chevronRight .. " ",
  -- limit for amount of context shown, 0 means no limit
  depth = 0,
  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
  text_hl = "LineNr",
}
