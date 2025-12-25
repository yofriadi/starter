local submit_keys = {
  -- Optional: custom keymaps for this tool
  submit = {
    "<c-s>",
    function(t)
      t:send "\n"
    end,
  },
}

return {
  {
    "carbon-steel/detour.nvim",
    config = function()
      vim.keymap.set("n", "<C-W><CR>", ":Detour<CR>")
      vim.keymap.set("n", "<C-W>.", ":DetourCurrentWindow<CR>")
    end,
  },
  {
    "nvim-focus/focus.nvim",
    version = "*",
    event = "VimEnter",
    opts = {},
    config = function(_, opts)
      require("focus").setup(opts)

      local ignore_buftypes = { "nofile", "prompt", "popup", "terminal" }
      local ignore_filetypes = {
        "neo-tree",
        "neo-tree-popup",
        "neo-tree-preview",
        "sidekick_terminal",
      }

      local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

      local function apply_focus_disable()
        local bt = vim.bo.buftype
        local ft = vim.bo.filetype
        local disable = vim.tbl_contains(ignore_buftypes, bt) or vim.tbl_contains(ignore_filetypes, ft)

        vim.w.focus_disable = disable
        vim.b.focus_disable = disable
      end

      vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "FileType", "TermOpen" }, {
        group = augroup,
        callback = function(_)
          apply_focus_disable()
        end,
        desc = "Disable focus autoresize for excluded buffers/windows",
      })

      apply_focus_disable()
    end,
  },
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
            keys = {
              submit = submit_keys,
            },
          },
          coder = {
            cmd = { "coder" },
            keys = {
              submit = submit_keys,
            },
          },
          amp = {
            cmd = { "amp" },
            keys = {
              submit = submit_keys,
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
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "sidekick")
      require("sidekick").setup(opts)
    end,
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
        "<leader>acc",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
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
      {
        "<leader>acm",
        function() require("sidekick.cli").toggle({ name = "amp", focus = true }) end,
        desc = "Sidekick Toggle Amp",
      },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    keys = {
      { "<leader>gB", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
    },
    config = function()
      require("blame").setup {}
    end,
  },
}
