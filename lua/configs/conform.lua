local nvchad_conform = require "nvchad.configs.conform"

local M = {}

function M.opts(_, opts)
  local defaults = nvchad_conform()
  opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})

  opts.formatters_by_ft = vim.tbl_deep_extend("force", {}, defaults.formatters_by_ft or {}, {
    lua = { "stylua" },
    -- Use LSP formatting with conform.nvim's improvements (preserves extmarks, folds, fixes bad LSP formatters)
    css = { lsp_format = "fallback" },
    html = { lsp_format = "fallback" },
    javascript = { lsp_format = "fallback" },
    typescript = { lsp_format = "fallback" },
    javascriptreact = { lsp_format = "fallback" },
    typescriptreact = { lsp_format = "fallback" },
    json = { lsp_format = "fallback" },
    jsonc = { lsp_format = "fallback" },
  })

  return opts
end

return M
