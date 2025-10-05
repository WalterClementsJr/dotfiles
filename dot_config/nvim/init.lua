local keymap = vim.keymap.set

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

keymap("i", "jk", "<Esc>")
-- term
keymap("t", "JK", "<C-\\><C-n>")
keymap("t", "<Esc><Esc>", "<C-\\><C-n>")
-- visual indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- resize
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

keymap(
  { "i", "n", "s" },
  "<esc>",
  function()
    vim.cmd("noh")
    return "<esc>"
  end,
  { expr = true, desc = "Escape and Clear hlsearch" }
)
keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
-- buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Kill Buffer" })

require("config.lazy") -- lazy.nvim
require("config._") -- personal qol

