return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        win = {
          split = {
            width = 80,
          },
        },
        mux = {
          backend = "zellij",
          enabled = false,
        },
        tools = {
          ccr = {
            cmd = { "ccr", "code" },
            -- Optional: custom keymaps for this tool
            keys = {
              submit = {
                "<c-s>",
                function(t)
                  t:send "\n"
                end,
              },
            },
          },
          coder = {
            cmd = { "coder" },
            keys = {
              submit = {
                "<c-s>",
                function(t)
                  t:send "\n"
                end,
              },
            },
          },
        },
        prompts = {
          refactor = "Please refactor {this} to be more maintainable",
          security = "Review {file} for security vulnerabilities",
          custom = function(ctx)
            return "Current file: " .. ctx.buf .. " at line " .. ctx.row
          end,
        },
      },
      nes = { enabled = false },
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
      --[[{
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },]]
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
        "<leader>acd",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
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
      -- below is agent specific shortcuts
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
  {
    "saghen/blink.cmp",
    config = function(_, opts)
      opts.keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      }
      return opts
    end,
  },
}
