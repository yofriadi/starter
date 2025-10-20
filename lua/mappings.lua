require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- routes common change/delete motions through the black-hole register: c/ C for normal changes, x/X for character deletes, and s/S for substitutions, all without polluting yank history.
map("n", "c", '"_c', { desc = "Change without yanking" })
map("n", "C", '"_C', { desc = "Change line without yanking" })
map({ "n", "x" }, "x", '"_x', { desc = "Delete without yanking" })
map({ "n", "x" }, "X", '"_X', { desc = "Backspace without yanking" })
map({ "n", "x" }, "s", '"_s', { desc = "Substitute without yanking" })
map("n", "S", '"_S', { desc = "Substitute line without yanking" })

map("n", "<S-H>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-L>", ":bnext<CR>", { desc = "Next buffer" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
