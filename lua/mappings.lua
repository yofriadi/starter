require "nvchad.mappings"

local map = vim.keymap.set
local tabufline = require "nvchad.tabufline"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "Q", "q", { noremap = true, desc = "Record macro" })

map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- routes common change/delete motions through the black-hole register: c/ C for normal changes, x/X for character deletes, and s/S for substitutions, all without polluting yank history.
map("n", "c", '"_c', { desc = "Change without yanking" })
map("n", "C", '"_C', { desc = "Change line without yanking" })
map("n", "S", '"_S', { desc = "Substitute line without yanking" })
map({ "n", "x" }, "x", '"_x', { desc = "Delete without yanking" })
map({ "n", "x" }, "X", '"_X', { desc = "Backspace without yanking" })
map({ "n", "x" }, "s", '"_s', { desc = "Substitute without yanking" })

-- Tab mappings
map("n", "<Tab><Tab>", vim.cmd.tabnew, { desc = "Tab new" })
map("n", "<Tab><BS>", vim.cmd.tabclose, { desc = "Tab close" })
map("n", "<Tab>l", vim.cmd.tabnext, { desc = "Tab next" })
map("n", "<Tab>h", vim.cmd.tabprevious, { desc = "Tab previous" })

-- Buffer mappings
map("n", "<Leader><Leader>", "<Cmd>e #<CR>", { desc = "Buffer switch to alternate" })
map("n", "<Leader>bn", "<Cmd>enew<CR>", { desc = "Buffer New" })
map("n", "<S-L>", function()
  tabufline.nav(vim.v.count1)
end, { desc = "Next buffer" })

map("n", "<S-H>", function()
  tabufline.nav(-vim.v.count1)
end, { desc = "Previous buffer" })

map("n", "q", function()
  tabufline.close_buffer()
end, { desc = "Close buffer" })

map("n", "<Leader>bc", function()
  tabufline.close_buffer()
end, { desc = "Close buffer" })

map("n", "<Leader>bC", function()
  tabufline.close_buffer(nil, true)
end, { desc = "Force close buffer" })

map("n", ">b", function()
  tabufline.move_buf(vim.v.count1)
end, { desc = "Move buffer tab right" })

map("n", "<b", function()
  tabufline.move_buf(-vim.v.count1)
end, { desc = "Move buffer tab left" })

--[[map("n", "<Leader>bCa", function()
  tabufline.close_all(true)
end, { desc = "Close all buffers except current" })

map("n", "<Leader>bCA", function()
  tabufline.close_all(false)
end, { desc = "Close all buffers" })

map("n", "<Leader>bCl", function()
  tabufline.close_left()
end, { desc = "Close buffers to the left" })

map("n", "<Leader>bCr", function()
  tabufline.close_right()
end, { desc = "Close buffers to the right" })]]

--map({ "n", "i", "v" }, "<c-s>", "<cmd> w <cr>")
