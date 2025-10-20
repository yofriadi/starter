require "nvchad.options"

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"
opt.wrap = false
opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
  eob = " ", -- Disable `~` on nonexistent lines.
}
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.laststatus = 3
opt.linebreak = true
opt.showbreak = "↪ "
opt.mouse = ""
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 0
opt.shortmess = vim.tbl_deep_extend("force", opt.shortmess:get(), { W = true, I = true, c = true, C = true })
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 300
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.smoothscroll = true
opt.backspace:append { "nostop" }
opt.breakindent = true
opt.cmdheight = 0
opt.copyindent = true
opt.diffopt:append { "algorithm:histogram", "linematch:60" }
opt.infercase = true
opt.jumpoptions = { "view" }
opt.preserveindent = true
opt.showtabline = 2
opt.viewoptions = vim.tbl_filter(function(val)
  return val ~= "curdir"
end, opt.viewoptions:get())
opt.writebackup = false
opt.shada = "!,'1000,<50,s10,h"
opt.history = 1000
opt.swapfile = false
opt.colorcolumn = "120"
opt.fileencoding = "utf-8"
opt.guicursor = "n:blinkon200,i-ci-ve:ver25"
