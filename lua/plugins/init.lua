return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = function(_, opts)
      return require("configs.conform").opts(_, opts)
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      return require("configs.lspconfig").opts(_, opts)
    end,
  },

  {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
  },


  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "typescript",
        "tsx",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local config = require("configs.lspconfig")
      opts = config.opts(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        tsgo = {},
        tailwindcss = {},
        html = { on_attach = config.on_attach },
        cssls = { on_attach = config.on_attach },

        jsonls = {},
        emmet_language_server = {},
      })
      return opts
    end,
  },
  {
    "sohanemon/tsgo.nvim",
    cmd = { "TSGo", "TSGoStop" },
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
      },
    },
  },
}
