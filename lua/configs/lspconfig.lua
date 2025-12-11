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

function M.on_attach(client, bufnr)
  require("nvchad.configs.nvim-lspconfig").lsp.on_attach(client, bufnr)

  if client.name == "html" or client.name == "cssls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "tsgo" then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
})

return M
