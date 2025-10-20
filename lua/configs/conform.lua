local nvchad_conform = require "nvchad.configs.conform"

local M = {}

function M.opts(_, opts)
  local defaults = nvchad_conform()
  opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})

  opts.formatters_by_ft = vim.tbl_deep_extend("force", {}, defaults.formatters_by_ft or {}, {
    lua = { "stylua" },
  })

  return opts
end

return M
