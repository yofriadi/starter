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

  { import = "nvchad.blink.lazyspec" },
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
      opts = require("configs.lspconfig").opts(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        tsgo = {},
        tailwindcss = {},
        html = {},
        cssls = {},
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
}
