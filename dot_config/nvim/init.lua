require("config.lazy")

local keymap = vim.keymap.set

keymap("i", "jk", "<Esc>")
keymap("t", "JK", "<C-\\><C-n>")
-- keymap("t", "C-/>", "<C-\\><C-n>q")

vim.g.snacks_animate = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.showcmd = true

vim.opt.clipboard = "unnamed"

vim.opt.conceallevel = 0
vim.opt.cursorline = false
