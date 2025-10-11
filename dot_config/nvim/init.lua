local keymap = vim.keymap.set

keymap("i", "jk", "<Esc>")
keymap("t", "JK", "<C-\\><C-n>")

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.showcmd = true

vim.opt.clipboard = "unnamedplus"

vim.opt.conceallevel = 0
vim.opt.cursorline = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

require("config.lazy")
