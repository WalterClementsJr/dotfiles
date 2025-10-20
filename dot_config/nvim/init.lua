vim.cmd("source ~/.vimrc") -- use base config from Vim

require("config.lazy") -- lazy.nvim

require("lualine").setup()
require("mason").setup()
require("mason-lspconfig").setup()

local opt = vim.opt

opt.inccommand = "split" -- regex replace preview
opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- already have a status line
opt.wildmode = "longest:full,full"
opt.pumblend = 10
opt.jumpoptions = "view"

vim.g.maplocalleader = "\\"

vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.deprecation_warnings = false
vim.g.trouble_lualine = true
vim.g.markdown_recommended_style = 0

local keymap = vim.keymap.set
keymap("t", "<Esc><Esc>", "<C-\\><C-n>")

keymap({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("nohlsearch")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })
keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Kill Buffer" })

keymap({ "n", "t" }, "<space>tt", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
keymap("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
keymap("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })

vim.cmd.colorscheme("nightfly")
