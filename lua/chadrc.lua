-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine-dawn",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.dashboard = { load_on_startup = true }
M.ui = {
  --tabufline = {
  --  lazyload = false
  --}
  lualine = {
    enabled = true,
    theme = "nvchad",          -- auto/nvchad/nvchad_vscode/nvchad_minimal
    separator_style = "block", -- default/round/block/arrow
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "file", "branch" },
      lualine_c = {},
      lualine_x = { "diagnostics", "lsp" },
      lualine_y = { "progress", "location" },
      lualine_z = { "cwd" },
    },
    disabled_filetypes = {},
  },
}

return M
