return {
  cli = {
    mux = {
      backend = "zellij",
      enabled = false,
    },
    tools = {
      ccr = {
        cmd = { "ccr", "code" },
        -- Optional: custom keymaps for this tool
        keys = {
          submit = { "<c-s>", function(t) t:send "\n" end },
        },
      },
      coder = {
        cmd = { "coder" },
        keys = {
          submit = { "<c-s>", function(t) t:send "\n" end },
        },
      },
    },
    prompts = {
      refactor = "Please refactor {this} to be more maintainable",
      security = "Review {file} for security vulnerabilities",
      custom = function(ctx) return "Current file: " .. ctx.buf .. " at line " .. ctx.row end,
    },
  },
  nes = { enabled = false },
}