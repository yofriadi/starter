local nvchad_lspconfig = require "nvchad.configs.nvim-lspconfig"

local M = {}

function M.opts(_, opts)
  opts = opts or vim.deepcopy(nvchad_lspconfig.opts)

  opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
    underline = true,
    virtual_text = false,
  })

  return opts
end

return M
