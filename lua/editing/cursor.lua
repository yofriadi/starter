return {
  { "cpea2506/relative-toggle.nvim" },
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = true,
    keys = function()
      local gtp = require "goto-preview"
      return {
        { "gpd", gtp.goto_preview_definition, desc = "LSP definition of current symbol", noremap = true },
        { "gpt", gtp.goto_preview_type_definition, desc = "LSP type definition of current symbol", noremap = true },
        { "gpi", gtp.goto_preview_implementation, desc = "LSP implementation of current symbol", noremap = true },
        { "gpD", gtp.goto_preview_declaration, desc = "LSP declaration of current symbol", noremap = true },
        { "gP", gtp.close_all_win, desc = "LSP close all window", noremap = true },
        { "gpr", gtp.goto_preview_references, desc = "LSP references of current symbol", noremap = true },
      }
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
