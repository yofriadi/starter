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

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "folke/sidekick.nvim",
    opts = require "configs.sidekick",
    dependencies = {
      "saghen/blink.cmp",
      opts = function(_, opts)
        opts.keymap = opts.keymap or {}
        opts.keymap["<Tab>"] = {
          "snippet_forward",
          function()
            return require("sidekick").nes_jump_or_apply()
          end,
          function()
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        }
        return opts
      end,
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      --[[
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      ]]
      {
        "<leader>aca",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>acs",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>act",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>acf",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send File",
      },
      {
        "<leader>acv",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>acp",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<leader>acx",
        function() require("sidekick.cli").toggle({ name = "codex", focus = true }) end,
        desc = "Sidekick Toggle Codex",
      },
      {
        "<leader>acd",
        function() require("sidekick.cli").toggle({ name = "coder", focus = true }) end,
        desc = "Sidekick Toggle Coder",
      },
      {
        "<leader>acr",
        function() require("sidekick.cli").toggle({ name = "ccr", focus = true }) end,
        desc = "Sidekick Toggle Claude Code Router",
      },
      {
        "<leader>acg",
        function() require("sidekick.cli").toggle({ name = "gemini", focus = true }) end,
        desc = "Sidekick Toggle Gemini",
      },
      {
        "<leader>acq",
        function() require("sidekick.cli").toggle({ name = "qwen", focus = true }) end,
        desc = "Sidekick Toggle Qwen",
      },
    },
  },

  --{
  --	"nvim-treesitter/nvim-treesitter",
  --	opts = {
  --		ensure_installed = {
  --			"vim", "lua", "vimdoc",
  --     "html", "css"
  --		},
  --	},
  --},
}
