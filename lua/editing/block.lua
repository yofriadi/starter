return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      exclude_filetypes = {
        neotree = true,
        dashboard = true,
      },
      chunk = {
        enable = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = "─",
        },
        style = "#806d9c",
      },
      line_num = {
        enable = true,
        style = "#806d9c",
      },
    },
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    -- optionally, lazy load on entering visual mode
    event = "ModeChanged *:[vV\22]",
    opts = {
      list_chars = {
        space = ".",
        tab = "→.",
        nbsp = ".",
        lead = "•",
        trail = "•",
      },
    },
  },
}
