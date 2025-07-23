-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nord",

  changed_themes = {
    nord = {
      base_16 = {
        base00 = "#252a34",
        base02 = "#2b364e",
        base09 = "#fca5a5",
        base0B = "#d9f99d",
        base0D = "#38bdf8",
        base0E = "#fdba74",
        base0F = "#fca5a5",
      },
      base_30 = {
        black2 = "#494f5b",
        red = "#fca5a5",
        purple = "#e1c181",
        base00 = "#252a34",
      },
    },
  },

  statusline = {
    theme = "vscode_colored",
    overriden_modules = function(modules)
      table.remove(modules, 13)
      table.remove(modules, 11)
      table.remove(modules, 10)
      table.remove(modules, 9)
      table.insert(modules, cursorPosition())
    end,
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NvimTreeGitDirty = { fg = "yellow" },
    NvimTreeRootFolder = {
      fg = "",
      bold = true,
    },
    Folded = {
      bg = "base00",
    },
  },
}

return M
